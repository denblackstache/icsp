# frozen_string_literal: true

module CSP
  def self.config
    @config ||= Config.new
  end

  def self.logger
    @logger ||= Logger.new($stdout, level: Object.const_get("Logger::Severity::#{config.log_level}"))
  end
end
