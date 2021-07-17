# frozen_string_literal: true

module CSP
  module Commands
    module Container
      class List < ::CSP::Commands::BaseCommand
        def csptest
          @csptest ||= @config.csptest
        end

        def execute
          result = ::CSP::Shell.new("#{csptest} -keyset -enum_containers -verifycontext -fqcn").execute
          exit(result.exit_code) unless result.ok

          result.output_lines.filter { |l| l.start_with?('\\') }
        end

        def print
          puts execute
        end

        def select
          @prompt.select('Choose container:', execute)
        end
      end
    end
  end
end
