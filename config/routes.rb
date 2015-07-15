CacheClear::Engine.routes.draw do
  delete 'foo', to: 'cache_clear#clear_cache'
end
