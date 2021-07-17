# frozen_string_literal: true

class Config
  def initialize
    @bin = %i[certmgr cryptcp csptest].freeze
    @sbin = [:cpconfig].freeze
  end

  def csp_path
    @csp_path ||= ENV.fetch('CSP_PATH', '/opt/cprocsp')
  end

  def build_path(binary_name)
    File.join(csp_path, category_path(binary_name), arch_path, binary_name.to_s)
  end

  def category_path(binary_name)
    @sbin.include?(binary_name) ? 'sbin' : 'bin'
  end

  def arch_path
    return '' if OS.mac?

    OS.bits == 64 ? 'amd64' : 'ia32'
  end

  def log_level
    @log_level ||= ENV.fetch('LOG_LEVEL', 'warn').upcase
  end

  private

  def method_missing(symbol, *args)
    if @bin.include?(symbol) || @sbin.include?(symbol)
      build_path(symbol)
    else
      super
    end
  end

  def respond_to_missing?(symbol, *args)
    if @bin.include?(symbol) || @sbin.include?(symbol)
      true
    else
      super
    end
  end
end
