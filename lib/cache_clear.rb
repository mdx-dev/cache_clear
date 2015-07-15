require "cache_clear/engine"

module CacheClear
  class << self
    def configure
      yield config
    end

    def config
      @config ||= Struct.new(:auth_token).new
    end

    def authorized?(params)
      !config.auth_token || config.auth_token == params[:auth_token]
    end
  end
end
