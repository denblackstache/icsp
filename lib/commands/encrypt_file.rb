# frozen_string_literal: true

module ICSP
  module Commands
    class EncryptFile < ::ICSP::Commands::BaseCommand
      def cryptcp
        @cryptcp ||= @config.cryptcp
      end

      def execute
        input_file = arguments.first
        output_file = arguments.last
        result = ::ICSP::Shell.new(
          "#{cryptcp} -encr -thumbprint '#{options[:certificate_file]}' #{input_file} #{output_file}", convert_to_utf8: false
        ).execute
        exit(result.exit_code) unless result.ok

        puts result
      end
    end
  end
end
