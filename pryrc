#!/usr/bin/env ruby

Pry.editor = 'vi'

# This prompt shows the ruby version (useful for RVM)
Pry.prompt = [proc { |obj, nest_level, _| "#{RUBY_VERSION} (#{obj}):#{nest_level} > " }, proc { |obj, nest_level, _| "#{RUBY_VERSION} (#{obj}):#{nest_level} * " }]

# === Listing config ===
# Better colors - by default the headings for methods are too 
# similar to method name colors leading to a "soup"
# These colors are optimized for use with Solarized scheme 
# for your terminal
Pry.config.ls.separator = "\n" # new lines between methods
Pry.config.ls.heading_color = :magenta
Pry.config.ls.public_method_color = :green
Pry.config.ls.protected_method_color = :yellow
Pry.config.ls.private_method_color = :bright_black


# == PLUGINS ===
# awesome_print gem: great syntax colorized printing
# look at ~/.aprc for more settings for awesome_print
begin
  require 'awesome_print'

  # and it also enables paging
  Pry.config.print = proc {|output, value| Pry::Helpers::BaseHelpers.stagger_output("=> #{value.ai}", output)}

  # If you want awesome_print without automatic pagination, use the line below
  # Pry.config.print = proc { |output, value| output.puts value.ai }
rescue LoadError => err
  puts "gem install awesome_print  # <-- highly recommended"
end


# load rails or RACK app if runnning pry in a project
if Dir.exists? './config'
  current_app = './config/application.rb' if File.exists? './config/application.rb'
  current_app = './config/environment.rb' if File.exists? './config/environment.rb'
  require current_app if current_app
end

if defined? Rails && Rails.version[0..0] == "3"
  require 'rails/console/app'
  require 'rails/console/helpers'
end

# Load plugins (only those I whitelist)
Pry.config.should_load_plugins = false
Pry.plugins["doc"].activate!
