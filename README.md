# CSS Lint for Sass & Compass

Easily integrate Nicholas C. Zakas and Nicole Sullivan's [CSS Lint](http://csslint.net/) into your projects that use the Compass CSS Framework by providing a `compass csslint` command line option.

## Installation

There is currently a [bug in Compass](https://github.com/chriseppstein/compass/issues/1053) that prevents external Compass commands from being registered if they're required in a project's config.rb file. So until that is resolved, you'll have to build this custom version of Compass that includes compass-csslint:

https://github.com/Comcast/compass

Clone that project, then from the root run

    $ gem build compass.gemspec

Be sure to take note of the .gem filename

Once that builds, you'll need to first uninstall your existing Compass gem

    $ gem uninstall compass

And then install your locally-built version of Compass

    $ gem install compass-0.12.2.<hash>.gem

Once that is installed, you can safely install compass-csslint. Clone the repo:

https://github.com/Comcast/compass-csslint

From the root of that project run

    $ gem build compass-csslint.gemspec

And then install your locally-built version of the gem

    $ gem install compass-csslint-0.0.1.gem

## Usage

Run the following command from the root of your Compass project:

    $ compass csslint

To view options:

    $ compass csslint --help

## Additional Links

For a bare-bones sample project to see this in action, checkout the [compass-csslint-sample](https://github.com/Comcast/compass-csslint-sample) repo

To run CSS Lint without Compass, you can use the standalone ruby gem:

    $ gem install css_lint_ruby


* https://rubygems.org/gems/css_lint
* https://github.com/Comcast/css_lint_ruby

## Authors

* John Riviello - https://github.com/JohnRiv
* Mike Ball - https://github.com/mdb

Thanks for assistance and contributions:
* Jen Valure - https://github.com/calophi
* Mike Rottina - https://github.com/rottina