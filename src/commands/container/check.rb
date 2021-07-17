# frozen_string_literal: true

module CSP
  module Commands
    module Container
      class Check < ::CSP::Commands::BaseCommand
        def csptest
          @csptest ||= @config.csptest
        end

        def execute
          result = ::CSP::Shell.new("#{csptest} -keyset -check -cont '#{selected_container}'").execute
          exit(result.exit_code) unless result.ok

          puts result
        end

        def selected_container
          ::CSP::Commands::Container::List.new(config: config, options: options, arguments: arguments).select
        end
      end
    end
  end
end
