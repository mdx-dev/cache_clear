Rails.application.routes.draw do

  mount CacheClear::Engine => "/cache_clear"
end
