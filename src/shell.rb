# frozen_string_literal: true

module CSP
  # Shell
  class Shell
    def initialize(command, split: true, convert_to_utf8: true, fork: true)
      @command = command
      @split = split
      @convert_to_utf8 = convert_to_utf8
      @fork = fork
    end

    def execute
      ::CSP.logger.info("command: #{@command}")
      unless @fork
        exec(@command)
        return
      end

      raw_output = `#{@command}`
      exec_success = $CHILD_STATUS.success?
      exit_code = $CHILD_STATUS.exitstatus

      output = @convert_to_utf8 ? raw_output.force_encoding('cp1251').encode('utf-8', undef: :replace) : raw_output
      csp_error_code = ''
      output_lines = []

      if @split
        output_lines = output.split("\n")
        csp_error_code_line = output_lines.find { |l| l.include?('ErrorCode') }
        csp_error_code = /0x0*[1-9a-fA-F][0-9a-fA-F]*/.match(csp_error_code_line).to_s
      end

      shell_result = ::CSP::ShellResult.new(
        output: output,
        output_lines: output_lines,
        csp_error_code: csp_error_code,
        ok: exec_success && csp_error_code == '',
        exit_code: exit_code
      )

      ::CSP.logger.debug("ok: #{shell_result.ok}")
      shell_result
    end
  end
end
