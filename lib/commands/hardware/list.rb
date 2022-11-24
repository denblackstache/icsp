# frozen_string_literal: true

module ICSP
  module Commands
    module Hardware
      class List < ::ICSP::Commands::BaseCommand
        def cpconfig
          @cpconfig ||= @config.cpconfig
        end

        def execute
          type = options[:type] || 'reader'
          result = ::ICSP::Shell.new("#{cpconfig} -hardware #{type} -view").execute
          exit(result.exit_code) unless result.ok

          puts result
        end
      end
    end
  end
end
