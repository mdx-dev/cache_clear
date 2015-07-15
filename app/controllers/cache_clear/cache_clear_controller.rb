module CacheClear
  class CacheClearController < ApplicationController
    def clear_cache
      Rails.cache.clear
    end
  end
end
