# frozen_string_literal: true

module CSP
  module Commands
    module Container
      class ChangePinCode < ::CSP::Commands::BaseCommand
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
