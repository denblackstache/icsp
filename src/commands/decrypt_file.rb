# frozen_string_literal: true

module CSP
  module Commands
    class DecryptFile < ::CSP::Commands::BaseCommand
      def cryptcp
        @cryptcp ||= @config.cryptcp
      end

      def execute
        input_file = arguments.first
        output_file = arguments.last
        result = ::CSP::Shell.new(
          "#{cryptcp} -decr -f '#{options[:certificate_file]}' -start #{input_file} #{output_file}", convert_to_utf8: false
        ).execute
        exit(result.exit_code) unless result.ok

        puts result
      end
    end
  end
end
