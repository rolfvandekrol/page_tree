$:.push File.expand_path("../lib", __FILE__)

version = File.read(File.expand_path("../../VERSION", __FILE__)).strip

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "page_tree_frontend"
  s.version     = version
  s.authors     = ["Rolf van de Krol"]
  s.email       = ["info@rolfvandekrol.nl"]
  s.homepage    = "https://github.com/rolfvandekrol/page_tree"
  s.summary     = "Page Tree Frontend"
  s.description = "Provides an interface to a tree of pages."
  s.license     = "MIT"

  s.files = Dir["{app,config,lib}/**/*", "LICENSE"]

  s.add_dependency 'page_tree_core', version

  s.add_dependency 'foundation-rails', '~> 5.3.1.0'
  s.add_dependency 'foundation-icons-sass-rails', '~> 3.0.0'
  s.add_dependency 'sprockets-require_module', '~> 1.0.0'
end
