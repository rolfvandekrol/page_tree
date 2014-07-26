$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "page_tree/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "page-tree"
  s.version     = PageTree::VERSION
  s.authors     = ["Rolf van de Krol"]
  s.email       = ["info@rolfvandekrol.nl"]
  s.homepage    = "TODO"
  s.summary     = "TODO: Summary of PageTree."
  s.description = "TODO: Description of PageTree."
  s.license     = "MIT"

  s.files = Dir["{app,config,db,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.rdoc"]
  s.test_files = Dir["test/**/*"]

  s.add_dependency "rails", "~> 4.1.2"

  s.add_development_dependency "sqlite3"
end
