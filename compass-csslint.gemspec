# -*- encoding: utf-8 -*-
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)

Gem::Specification.new do |gem|
  gem.name          = "compass-csslint"
  gem.version       = "0.1.0"
  gem.authors       = ["John Riviello", "Mike Ball"]
  gem.description   = %q{Easily integrate CSS Lint into your projects that use the Compass CSS Framework}
  gem.summary       = %q{Runs CSS Lint against the CSS that Sass/Compass generates}
  gem.homepage      = "http://comcast.github.com/compass-csslint/"
  gem.license       = "MIT"

  gem.files         = ['./lib/compass-csslint.rb']
  gem.require_paths = ["lib"]

  gem.add_runtime_dependency 'compass', '>= 1.0.0.alpha.13'
  gem.add_runtime_dependency 'css_lint', '>= 0.10.0.0'
end
