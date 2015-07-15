module CacheClear
  class CacheClearController < ApplicationController
    def clear_cache
      Rails.cache.clear
      head :ok
    end
  end
end
