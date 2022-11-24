# frozen_string_literal: true

module ICSP
  module Commands
    module Container
      class ChangePinCode < ::ICSP::Commands::BaseCommand
        def csptest
          @csptest ||= @config.csptest
        end

        def execute
          raise 'Not implemented'
        end
      end
    end
  end
end
