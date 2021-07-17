# frozen_string_literal: true

module CSP
  # ShellResult
  class ShellResult
    def initialize(ok:, exit_code:, output:, output_lines:, csp_error_code:)
      @ok = ok
      @exit_code = exit_code
      @output = output
      @output_lines = output_lines
      @csp_error_code = csp_error_code
    end

    attr_reader :ok, :exit_code, :output, :output_lines, :csp_error_code

    def to_s
      output
    end
  end
end
