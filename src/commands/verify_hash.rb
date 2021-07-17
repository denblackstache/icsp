# frozen_string_literal: true

module CSP
  module Commands
    class VerifyHash < ::CSP::Commands::BaseCommand
      def cryptcp
        @cryptcp ||= @config.cryptcp
      end

      def execute
        input_file = arguments.first
        result = ::CSP::Shell.new("#{cryptcp} -vhash -hex #{input_file}", convert_to_utf8: false).execute
        exit(result.exit_code) unless result.ok

        puts result
      end
    end
  end
end
