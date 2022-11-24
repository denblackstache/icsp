# frozen_string_literal: true

module ICSP
  module Commands
    class CreateSignature < ::ICSP::Commands::BaseCommand
      def cryptcp
        @cryptcp ||= @config.cryptcp
      end

      def execute
        input_file = arguments.first
        thumbprint = selected_certificate

        result = ::ICSP::Shell.new("#{cryptcp} -signf -thumbprint '#{thumbprint}' #{input_file}",
                                  convert_to_utf8: false, fork: false).execute
        exit(result.exit_code) unless result.ok

        puts result
      end

      def selected_certificate
        ::ICSP::Commands::Certificate::List.new(config: config, options: options, arguments: arguments).select
      end
    end
  end
end
