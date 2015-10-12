$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "cache_clear/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "cache_clear"
  s.version     = CacheClear::VERSION
  s.authors     = ["Ariel Caplan"]
  s.email       = ["ariel.caplan@mail.yu.edu"]
  s.homepage    = "http://github.com/amcaplan/cache_clear"
  s.summary     = "Easily set up a cache-clearing endpoint for your Rails app."
  s.description = "Easily set up a cache-clearing endpoint for your Rails app."
  s.license     = "MIT"

  s.files = Dir["{app,config,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.rdoc"]

  s.add_dependency "rails", "~> 4.0"
  s.add_development_dependency "rspec-rails", "~> 3.3"
  s.add_development_dependency "pry"
end
