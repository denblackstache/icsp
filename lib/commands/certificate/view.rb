# frozen_string_literal: true

module ICSP
  module Commands
    module Certificate
      class View < ::ICSP::Commands::BaseCommand
        def execute
          result = ::ICSP::Shell.new("openssl x509 -in #{arguments.first} -text -noout -nameopt multiline,-esc_msb,utf8").execute
          exit(result.exit_code) unless result.ok

          puts result
        end
      end
    end
  end
end
