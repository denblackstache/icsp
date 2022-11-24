# frozen_string_literal: true

module ICSP
  module Commands
    module License
      class Set < ::ICSP::Commands::BaseCommand
        def cpconfig
          @cpconfig ||= @config.cpconfig
        end

        def execute
          result = ::ICSP::Shell.new("#{cpconfig} -license -set #{arguments.first}").execute
          exit(result.exit_code) unless result.ok

          puts result
        end
      end
    end
  end
end
