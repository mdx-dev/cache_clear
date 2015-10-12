# CacheClear

[![Gem Version](https://badge.fury.io/rb/cache_clear.svg)](https://badge.fury.io/rb/cache_clear)

`CacheClear` is a simple pre-built solution for adding a cache-clearing endpoint
to your Rails app.

Just send a `DELETE` request to `/cache_clear` and the Rails cache will be
cleared. No need to enter the Rails console!

You can (and should!) configure `CacheClear` to use an authorization token, to
make sure no evil would-be DDoSers crash your app by continuously emptying the
caches.

`CacheClear` is great as a way for scripts (e.g. hubot) to clear caches remotely
without needing to directly touch your production servers.

## How to include CacheClear in your project

1) Add it to your gemfile:

``` ruby
gem 'cache_clear'
```

2) Mount it in `config/routes.rb`:

``` ruby
YourApp::Application.routes.draw do
  mount CacheClear::Engine => "/cache_clear" # or a route of your choosing
  # the rest of your file
end
```

3) Optional but strongly recommended: Set up authentication in an initializer
(e.g., `config/initializers/cache_clear.rb`):
``` ruby
CacheClear.configure do |config|
  config.auth_token = "super_secure_string"
end
```

...and you're good to go!

## License

This project uses the MIT-LICENSE.
