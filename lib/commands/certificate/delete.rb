# frozen_string_literal: true

module ICSP
  module Commands
    module Certificate
      class Delete < ::ICSP::Commands::BaseCommand
        def certmgr
          @certmgr ||= @config.certmgr
        end

        def execute
          store = prompt.select('Select store:', available_stores)
          result = ::ICSP::Shell.new("#{certmgr} -delete -store #{store}", fork: false).execute
          exit(result.exit_code) unless result.ok

          puts result
        end

        def available_stores
          %w[uMy root ca]
        end
      end
    end
  end
end
