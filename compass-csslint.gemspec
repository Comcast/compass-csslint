# -*- encoding: utf-8 -*-
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)

Gem::Specification.new do |gem|
  gem.name          = "compass-csslint"
  gem.version       = "0.0.1"
  gem.authors       = ["John Riviello", "Mike Ball"]
  gem.description   = %q{Runs CSS Lint against the CSS that Sass/Compass generates}
  gem.summary       = %q{Easily integrate CSS Lint into your projects that use the Compass CSS Framework}
  gem.homepage      = "http://comcast.github.com/compass-csslint/"

  gem.files         = ['./lib/compass-csslint.rb']
  gem.require_paths = ["lib"]

  gem.add_runtime_dependency 'compass'
  gem.add_runtime_dependency 'css_lint'

  gem.post_install_message = %{---------------------------------------------------------------------------------------------------
    Thank you for installing CSS Lint for Sass & Compass!
    Please note there is currently a bug in Compass that prevents this from working out of the box.
    A custom version of Compass is required to run (just a one line change).
    See http://comcast.github.com/compass-csslint/ for further details.
---------------------------------------------------------------------------------------------------
}
end
