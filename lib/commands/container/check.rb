# frozen_string_literal: true

module ICSP
  module Commands
    module Container
      class Check < ::ICSP::Commands::BaseCommand
        def csptest
          @csptest ||= @config.csptest
        end

        def execute
          result = ::ICSP::Shell.new("#{csptest} -keyset -check -cont '#{selected_container}'").execute
          exit(result.exit_code) unless result.ok

          puts result
        end

        def selected_container
          ::ICSP::Commands::Container::List.new(config: config, options: options, arguments: arguments).select
        end
      end
    end
  end
end
