# frozen_string_literal: true

module ICSP
  module Commands
    class CreateHash < ::ICSP::Commands::BaseCommand
      def cryptcp
        @cryptcp ||= @config.cryptcp
      end

      def execute
        input_file = arguments.first
        result = ::ICSP::Shell.new("#{cryptcp} -hash -hex #{input_file}", convert_to_utf8: false).execute
        exit(result.exit_code) unless result.ok

        puts result
      end
    end
  end
end
