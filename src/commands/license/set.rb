# frozen_string_literal: true

module CSP
  module Commands
    module License
      class Set < ::CSP::Commands::BaseCommand
        def cpconfig
          @cpconfig ||= @config.cpconfig
        end

        def execute
          result = ::CSP::Shell.new("#{cpconfig} -license -set #{arguments.first}").execute
          exit(result.exit_code) unless result.ok

          puts result
        end
      end
    end
  end
end
