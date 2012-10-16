require 'compass'
require 'compass/commands/registry'
require 'compass/commands/project_base'
require 'compass/commands/update_project'

module Compass
  module Commands
    module CSSLintOptionsParser
      def set_options(opts)
        opts.banner = %Q{
          Usage: compass csslint [options]* [path/to/project]*

          Description:
            Compile project at the path specified or the current
            directory if not specified and then run CSS Lint 
            against the generated CSS.
            
          Options:
        }.strip.split("\n").map{|l| l.gsub(/^ {0,10}/,'')}.join("\n")

        opts.on("-?", "-h", "--help", "Displays this information.") do
          puts opts
          exit
        end

        opts.on("--format=<format>", "Indicate which format to use for output.",
                "  One of: text, compact, lint-xml, csslint-xml, checkstyle-xml") do |format|
          self.options[:format] = format
        end

        opts.on("--list-rules", "Outputs all of the rules available.") do
          self.options[:list_rules] = true
          self.options[:nocompile] = true
        end
        
        opts.on("--quiet", "Only output when errors are present.") do
          self.options[:quiet] = true
        end
        
        opts.on("--errors=<rule[,rule]+>", "Indicate which rules to include as errors.") do |errors|
          self.options[:errors] = errors
        end
        
        opts.on("--warnings=<rule[,rule]+>", "Indicate which rules to include as warnings.") do |warnings|
          self.options[:warnings] = warnings
        end
        
        opts.on("--ignore=<rule,[,rule]+>", "Indicate which rules to ignore completely.") do |ignore|
          self.options[:ignore] = ignore
        end

        opts.on("--version", "Outputs the current version number of CSS Lint.\n\n") do
          self.options[:version] = true
          self.options[:nocompile] = true
        end

        super
      end
    end
    class CSSLintProject < ProjectBase

      require 'css_lint'
      include CSSLint

      register :csslint

      def initialize(working_path, options)
        super
        assert_project_directory_exists!
      end

      def perform
        @options_str = ''

        if options[:format]
          @options_str << '--format=' + options[:format] + ' '
        end

        if options[:list_rules]
          @options_str << '--list-rules'
        end

        if options[:quiet]
          @options_str << '--quiet '
        end

        if options[:errors]
          @options_str << '--errors=' + options[:errors] + ' '
        end

        if options[:warnings]
          @options_str << '--warnings=' + options[:warnings] + ' '
        end

        if options[:ignore]
          @options_str << '--ignore=' + options[:ignore] + ' '
        end

        if options[:version]
          @options_str << '--version'
        end

        if not(options[:nocompile])
          UpdateProject.new(working_path, options).perform
        end

        Dir.chdir Compass.configuration.project_path do
          Lint.new(project_css_subdirectory).execute(@options_str)
        end
      end

      class << self

        def option_parser(arguments)
          parser = Compass::Exec::CommandOptionParser.new(arguments)
          parser.extend(Compass::Exec::ProjectOptionsParser)
          parser.extend(CSSLintOptionsParser)
        end

        def usage
          option_parser([]).to_s
        end

        def description(command)
          "Run CSS Lint against your generated css."
        end

        def parse!(arguments)
          parser = option_parser(arguments)
          parser.parse!
          parse_arguments!(parser, arguments)
          parser.options
        end

        def parse_arguments!(parser, arguments)
          if arguments.size == 1
            parser.options[:project_name] = arguments.shift
          elsif arguments.size == 0
            # default to the current directory.
          else
            raise Compass::Error, "Too many arguments were specified."
          end
        end
      end
    end
  end
end