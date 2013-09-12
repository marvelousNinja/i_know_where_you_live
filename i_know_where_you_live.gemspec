$:.push File.expand_path('../lib', __FILE__)

# Maintain your gem's version:
require 'i_know_where_you_live/version'

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = 'i_know_where_you_live'
  s.version     = IKnowWhereYouLive::VERSION
  s.authors     = ['Alexander Sologub ']
  s.email       = ['alexsologoub@gmail.com']
  s.homepage    = 'https://github.com/marvelousNinja/i_know_where_you_live'
  s.summary     = 'Development and debugging tool'
  s.description = 'Tool with various features: template/partial path highlighting, opening these files right from the browser, and more.'

  s.files = Dir['{app,config,db,lib}/**/*', 'MIT-LICENSE', 'Rakefile', 'README.rdoc']

  s.add_dependency 'rails', '>= 3.1.0'
  s.add_dependency 'nokogiri'

  s.add_development_dependency 'sqlite3'
  s.add_development_dependency 'pry-nav'
  s.add_development_dependency 'rspec-rails'
end
