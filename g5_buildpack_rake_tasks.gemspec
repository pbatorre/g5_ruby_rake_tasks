$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "g5_buildpack_rake_tasks/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "g5_buildpack_rake_tasks"
  s.version     = G5BuildpackRakeTasks::VERSION
  s.authors     = ["Paula Torre"]
  s.email       = ["pbatorre@gmail.com"]
  s.homepage    = "http://github.com/pbatorre/g5_buildpack_rake_tasks"
  s.summary     = "G5 git hooks"
  s.description = "Executes rake tasks through git hooks"
  s.license     = "MIT"

  s.files = Dir["{app,config,db,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.rdoc"]
  s.test_files = Dir["test/**/*"]

  s.add_dependency "rails", "~> 4.0"

  s.add_development_dependency "sqlite3"
end
