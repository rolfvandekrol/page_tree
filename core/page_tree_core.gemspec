$:.push File.expand_path("../lib", __FILE__)

version = File.read(File.expand_path("../../VERSION", __FILE__)).strip

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "page_tree_core"
  s.version     = version
  s.authors     = ["Rolf van de Krol"]
  s.email       = ["info@rolfvandekrol.nl"]
  s.homepage    = "https://github.com/rolfvandekrol/page_tree"
  s.summary     = "Page Tree Core"
  s.description = "Provides a tree of pages."
  s.license     = "MIT"

  s.files = Dir["{app,db,lib}/**/*", "LICENSE"]

  s.add_dependency "rails", "~> 4.1.2"
  s.add_dependency 'awesome_nested_set', '~> 3.0.0'
  s.add_dependency 'friendly_id', '~> 5.0.0'
end
