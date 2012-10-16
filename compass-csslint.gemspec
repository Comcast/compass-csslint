# -*- encoding: utf-8 -*-
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)

Gem::Specification.new do |gem|
  gem.name          = "compass-csslint"
  gem.version       = "0.0.1"
  gem.authors       = ["John Riviello", "Mike Ball"]
  gem.description   = %q{Easily integrate CSS Lint into your projects that use the Compass CSS Framework}
  gem.summary       = %q{Runs CSS Lint against the CSS that SASS/Compass generates}
  gem.homepage      = "https://github.com/Comcast"

  gem.files         = ['./lib/compass-csslint.rb']
  gem.require_paths = ["lib"]

  gem.add_runtime_dependency 'compass'
  gem.add_runtime_dependency 'css_lint'
end
