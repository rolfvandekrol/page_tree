$:.push File.expand_path("../lib", __FILE__)

version = File.read(File.expand_path("../../VERSION", __FILE__)).strip

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "page_tree_markdown"
  s.version     = version
  s.authors     = ["Rolf van de Krol"]
  s.email       = ["info@rolfvandekrol.nl"]
  s.homepage    = "https://github.com/rolfvandekrol/page_tree"
  s.summary     = "Page Tree Markdown integration"
  s.description = "Provides a markdown body field to pages in a tree of pages."
  s.license     = "MIT"

  s.files = Dir["{app,lib}/**/*", "LICENSE"]

  s.add_dependency 'page_tree_core', version
  s.add_dependency 'page_tree_frontend', version

  s.add_dependency 'kramdown', '~> 1.4.1'
end
