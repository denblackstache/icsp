# frozen_string_literal: true

module ICSP
  module Commands
    class BaseCommand
      def initialize(config:, options:, arguments:)
        @config = config
        @options = options
        @arguments = arguments
        @prompt = TTY::Prompt.new
        ::ICSP.logger.debug('Command initialized with:')
        ::ICSP.logger.debug("arguments: #{@arguments.inspect}")
        ::ICSP.logger.debug("options: #{@options.inspect}")
      end

      attr_reader :config, :options, :arguments, :prompt
    end
  end
end
