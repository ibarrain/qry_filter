# frozen_string_literal: true

$LOAD_PATH.push File.expand_path('lib', __dir__)

# Maintain your gem's version:
require 'qry_filter/version'

# Describe your gem and declare its dependencies:
Gem::Specification.new do |spec|
  spec.name        = 'qry_filter'
  spec.version     = QryFilter::VERSION
  spec.authors     = ['Iñaki Ibarra']
  spec.email       = ['inaki.mateo.ibarra@gmail.com']
  spec.homepage    = 'https://github.com/inaki-ibarra/qry_filter'
  spec.summary     = 'Query filter helper for Rails'
  spec.description = 'A Rails add-on for handling query filters'
  spec.license     = 'MIT'

  spec.files = Dir[
    '{app,config,db,lib}/**/*',
    'MIT-LICENSE',
    'Rakefile',
    'README.md'
  ]

  spec.add_development_dependency 'activerecord', '~> 7.0'
  spec.add_development_dependency 'rake', '~> 13.0.1'
  spec.add_development_dependency 'rspec', '~> 3.8'
  spec.add_development_dependency 'rubocop', '~> 0.79.0'
  spec.add_development_dependency 'simplecov', '~> 0.17.0'
  spec.add_development_dependency 'sqlite3', '~> 1.4.1'
end
