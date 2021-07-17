# frozen_string_literal: true

module CSP
  module Commands
    module Hardware
      class List < ::CSP::Commands::BaseCommand
        def cpconfig
          @cpconfig ||= @config.cpconfig
        end

        def execute
          type = options[:type] || 'reader'
          result = ::CSP::Shell.new("#{cpconfig} -hardware #{type} -view").execute
          exit(result.exit_code) unless result.ok

          puts result
        end
      end
    end
  end
end
