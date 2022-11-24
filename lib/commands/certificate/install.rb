# frozen_string_literal: true

module ICSP
  module Commands
    module Certificate
      class Install < ::ICSP::Commands::BaseCommand
        def certmgr
          @certmgr ||= @config.certmgr
        end

        def execute
          unless options[:file]
            install_from_container
            return
          end

          install_from_file
        end

        def install_from_container
          result = ::ICSP::Shell.new("#{certmgr} -inst -cont '#{selected_container}'", convert_to_utf8: false).execute
          exit(result.exit_code) unless result.ok

          puts result
        end

        def install_from_file
          store = prompt.select('Select store:', available_stores)
          not_crl = prompt.no?('Is it CRL?')
          result = ::ICSP::Shell.new(
            "#{certmgr} -inst -file '#{options[:file]}' -store #{store} #{not_crl ? '' : '-crl'}", convert_to_utf8: false
          ).execute
          exit(result.exit_code) unless result.ok

          puts result
        end

        def selected_container
          ::ICSP::Commands::Container::List.new(config: config, options: options, arguments: arguments).select
        end

        def available_stores
          %w[uMy root ca]
        end
      end
    end
  end
end
