# frozen_string_literal: true

module ICSP
  module Commands
    module Certificate
      class List < ::ICSP::Commands::BaseCommand
        def certmgr
          @certmgr ||= @config.certmgr
        end

        def execute
          store = prompt.select('Select store:', available_stores)
          result = ::ICSP::Shell.new("#{certmgr} -list -store #{store}", convert_to_utf8: false).execute
          exit(result.exit_code) unless result.ok

          result
        end

        def select
          list_divider = '============================================================================='
          i = 1
          certificate_hash = {}
          certificates = []
          divider_count = 0
          execute.output_lines.each do |line|
            index_line = "#{i}-------"
            next_index_line = "#{i + 1}-------"
            if line == index_line || next_index_line || line == list_divider
              if line == "#{i}-------"
                certificate_hash = {}
                certificate_hash['index'] = i
                next
              end

              if line == "#{i + 1}-------"
                certificates << OpenStruct.new(certificate_hash.dup)
                i += 1
                certificate_hash = {}
                certificate_hash['index'] = i
              end

              if line == list_divider
                divider_count += 1
                break if divider_count == 2
              end
            end

            next unless certificate_hash['index']

            attribute = line.split(' : ').map(&:strip)
            key = attribute.first
            value = attribute[1..].join(' : ')

            certificate_hash[key] = value if key
          end

          choices = certificates.map { |certificate| [certificate['Subject'], certificate['SHA1 Hash']] }.to_h
          @prompt.select('Choose certificate:', choices)
        end

        def print
          puts execute
        end

        def available_stores
          %w[uMy root ca]
        end
      end
    end
  end
end
