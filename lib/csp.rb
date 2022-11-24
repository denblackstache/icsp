#!/usr/bin/env ruby
# frozen_string_literal: true

require 'logger'
require 'optionparser'
require 'ostruct'
require 'yaml'

require 'os'
require 'tty-prompt'

require_relative '../config/config'
require_relative '../config/environment'
require_relative '../lib/csp_option_parser'
require_relative '../lib/commands/base_command'
require_relative '../lib/shell'
require_relative '../lib/shell_result'

require_relative '../lib/commands/certificate/delete'
require_relative '../lib/commands/certificate/install'
require_relative '../lib/commands/certificate/list'
require_relative '../lib/commands/certificate/view'
require_relative '../lib/commands/container/check'
require_relative '../lib/commands/container/list'
require_relative '../lib/commands/hardware/list'
require_relative '../lib/commands/license/view'
require_relative '../lib/commands/license/set'
require_relative '../lib/commands/create_hash'
require_relative '../lib/commands/verify_hash'
require_relative '../lib/commands/encrypt_file'
require_relative '../lib/commands/decrypt_file'
require_relative '../lib/commands/create_signature'
require_relative '../lib/commands/verify_signature'

# CryptoPro CSP
module ICSP
  def self.to_camel_case(string)
    string.to_s.split('_').map(&:capitalize).join
  end

  def self.run
    parsed = ::ICSP::Services::OptionParserService.new.parse
    command_parts = %w[::ICSP Commands]
    command_parts << to_camel_case(parsed.command) if parsed.command
    command_parts << to_camel_case(parsed.subcommand) if parsed.subcommand
    command = Object.const_get(command_parts.join('::'))
                    .new(config: config, options: parsed.options, arguments: parsed.arguments)
    command.respond_to?(:print) ? command.print : command.execute
  rescue StandardError => e
    puts 'Application aborted with error:'
    raise e
  end

  run
end
