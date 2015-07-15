module CacheClear
  class CacheClearController < ApplicationController
    def clear_cache
      if ::CacheClear.authorized?(params)
        Rails.cache.clear
        head :ok
      else
        head :unauthorized
      end
    end
  end
end
