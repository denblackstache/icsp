# frozen_string_literal: true

module CSP
  module Commands
    class BaseCommand
      def initialize(config:, options:, arguments:)
        @config = config
        @options = options
        @arguments = arguments
        @prompt = TTY::Prompt.new
        ::CSP.logger.debug('Command initialized with:')
        ::CSP.logger.debug("arguments: #{@arguments.inspect}")
        ::CSP.logger.debug("options: #{@options.inspect}")
      end

      attr_reader :config, :options, :arguments, :prompt
    end
  end
end
