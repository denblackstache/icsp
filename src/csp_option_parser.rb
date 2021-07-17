# frozen_string_literal: true

module CSP
  module Services
    # OptionParserService
    class OptionParserService
      APP_HELP = <<~HELP
                  Available commands are:
                     certificate      Manage certificates
                     container        Manage containers
                     hardware         Manage hardware
                     license          Manage license
                     -----
                     sign_file#{'        '}
                     verify_signature
                     encrypt_file#{'     '}
                     decrypt_file
                #{'      '}
        #{'        '}
                  See 'csp COMMAND --help' for more information on a specific command.
                  For full documentation, see: https://github.com/denblackstache/cryptopro-cli#readme
      HELP

      def parse
        command = parse_command
        unless command
          puts 'No command passed'
          exit
        end

        subcommand_result = parse_subcommand(command)
        OpenStruct.new(
          command: command,
          subcommand: subcommand_result[:subcommand],
          arguments: subcommand_result[:arguments],
          options: subcommand_result[:options]
        )
      end

      private

      def parse_command
        global = OptionParser.new do |opts|
          opts.banner = 'Usage: csp [command] [subcommand] [options]'
          opts.separator('')
          opts.separator(APP_HELP)
        end
        global.order!
        ARGV.shift.to_sym unless ARGV.empty?
      end

      def parse_subcommand(command)
        options = {}
        subcommands = {
          encrypt_file: encrypt_file_option_parser(options),
          decrypt_file: decrypt_file_option_parser(options),
          create_hash: create_hash_option_parser(options),
          verify_hash: verify_hash_option_parser(options),
          create_signature: create_signature_option_parser(options),
          verify_signature: verify_signature_option_parser(options),
          certificate: {
            delete: certificate_delete_option_parser(options),
            install: certificate_install_option_parser(options),
            list: certificate_list_option_parser(options),
            view: certificate_list_option_parser(options)
          },
          container: {
            check: container_check_option_parser(options),
            list: container_list_option_parser(options)
          },
          hardware: {
            list: hardware_list_option_parser(options)
          },
          license: {
            view: license_view_option_parser(options),
            set: license_set_option_parser(options)
          }
        }

        is_management_command = subcommands[command].is_a?(Hash)
        subcommand = ARGV.shift.to_sym if is_management_command && !ARGV.empty?

        subcommand_option_parser = is_management_command ? subcommands[command][subcommand] : subcommands[command]
        subcommand_option_parser.parse!

        { subcommand: subcommand, arguments: ARGV.dup, options: options }
      end

      def encrypt_file_option_parser(options)
        OptionParser.new do |opts|
          opts.banner = 'Usage: csp encrypt_file [options]'
          opts.on('-f certificate_file', '--file certificate_file', String,
                  'certificate file path') do |certificate_file|
            options[:certificate_file] = certificate_file
          end
          opts.separator('')
          opts.separator('description')
        end
      end

      def decrypt_file_option_parser(options)
        OptionParser.new do |opts|
          opts.banner = 'Usage: csp decrypt_file [options]'
          opts.on('-f certificate_file', '--file certificate_file', String,
                  'certificate file path') do |certificate_file|
            options[:certificate_file] = certificate_file
          end
          opts.separator('')
          opts.separator('description')
        end
      end

      def create_hash_option_parser(_options)
        OptionParser.new do |opts|
          opts.banner = 'Usage: csp create_hash [options]'
          opts.separator('')
          opts.separator('description')
        end
      end

      def verify_hash_option_parser(_options)
        OptionParser.new do |opts|
          opts.banner = 'Usage: csp verify_hash [options]'
          opts.separator('')
          opts.separator('description')
        end
      end

      def create_signature_option_parser(_options)
        OptionParser.new do |opts|
          opts.banner = 'Usage: csp create_signature [options]'
          opts.separator('')
          opts.separator('description')
        end
      end

      def verify_signature_option_parser(_options)
        OptionParser.new do |opts|
          opts.banner = 'Usage: csp verify_signature [options]'
          opts.separator('')
          opts.separator('description')
        end
      end

      def certificate_delete_option_parser(_options)
        OptionParser.new do |opts|
          opts.banner = 'Usage: csp certificate delete [options]'
          opts.separator('')
          opts.separator('description')
        end
      end

      def certificate_install_option_parser(options)
        OptionParser.new do |opts|
          opts.banner = 'Usage: csp certificate install [options]'
          opts.on('-f file', '--file file', String, 'file path') do |file|
            options[:file] = file
          end
          opts.separator('')
          opts.separator('description')
        end
      end

      def certificate_list_option_parser(_options)
        OptionParser.new do |opts|
          opts.banner = 'Usage: csp certificate list [options]'
          opts.separator('')
          opts.separator('description')
        end
      end

      def certificate_view_option_parser(_options)
        OptionParser.new do |opts|
          opts.banner = 'Usage: csp certificate view [options]'
          opts.separator('')
          opts.separator('description')
        end
      end

      def container_check_option_parser(_options)
        OptionParser.new do |opts|
          opts.banner = 'Usage: csp container check [options]'
          opts.separator('')
          opts.separator('description')
        end
      end

      def container_list_option_parser(_options)
        OptionParser.new do |opts|
          opts.banner = 'Usage: csp container list [options]'
          opts.separator('')
          opts.separator('description')
        end
      end

      def hardware_list_option_parser(options)
        OptionParser.new do |opts|
          opts.banner = 'Usage: csp hardware list [options]'
          opts.on('-t hardware_type', '--type hardware_type', String,
                  'hardware_type - reader (default) | rndm | media') do |hardware_type|
            options[:type] = hardware_type
          end
          opts.separator('')
          opts.separator('Review of the installed readers, generators of random numbers and media')
        end
      end

      def license_view_option_parser(_options)
        OptionParser.new do |opts|
          opts.banner = 'Usage: csp license view'
          opts.separator('')
          opts.separator('description')
        end
      end

      def license_set_option_parser(_options)
        OptionParser.new do |opts|
          opts.banner = 'Usage: csp license set'
          opts.separator('')
          opts.separator('description')
        end
      end
    end
  end
end
