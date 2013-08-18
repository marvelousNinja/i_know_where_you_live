$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "i_know_where_you_live/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "i_know_where_you_live"
  s.version     = IKnowWhereYouLive::VERSION
  s.authors     = ["TODO: Your name"]
  s.email       = ["TODO: Your email"]
  s.homepage    = "TODO"
  s.summary     = "TODO: Summary of IKnowWhereYouLive."
  s.description = "TODO: Description of IKnowWhereYouLive."

  s.files = Dir["{app,config,db,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.rdoc"]

  s.add_dependency "rails", "~> 4.0.0"

  s.add_development_dependency "sqlite3"
end
