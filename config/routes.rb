CacheClear::Engine.routes.draw do
  delete '/', to: 'cache_clear#clear_cache'
end
