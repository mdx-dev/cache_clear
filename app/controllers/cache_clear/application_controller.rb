module CacheClear
  class ApplicationController < ActionController::Base
    delete '/', to: 'cache_clear#clear_cache'
  end
end
