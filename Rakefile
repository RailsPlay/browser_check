require 'bundler'
Bundler.setup
Bundler.require :default, :test, :build

Jeweler::Tasks.new do |gem|
  gem.name = 'browser_check'
  gem.summary = 'Checks for browser compatability'
  gem.description = "Checks that the users' browser supports certain features, and displays an error message if it doesn't."
  gem.email = 'steve@conceivian.com'
  gem.homepage = 'http://github.com/Conceivian/browser_check'
  gem.authors = ['Steve Sloan']

  gem.files = %w(
    MIT-LICENSE README.rdoc
  ) + Dir["{lib}/**/*", "{app}/**/*", "{config}/**/*"]
  gem.add_dependency 'haml', '~> 3.0.18'
  gem.add_dependency 'railties', '~> 3.0.0'
  gem.add_dependency 'actionpack', '~> 3.0.0'
end
Jeweler::GemcutterTasks.new
