# -*- ruby -*-

require 'rubygems'
require 'hoe'
$LOAD_PATH.unshift(File.dirname(__FILE__) + "/lib/")

# Allow regular rake to be used for quick tasks
if RUBY_PLATFORM == "java"
  require "clojure"
else
  module Clojure; VERSION="0" end
end

Hoe.plugin :git

Hoe.spec('clojure') do
  developer('Phil Hagelberg', 'technomancy@gmail.com')
  self.readme_file = "README.rdoc"
  spec_extras[:platform] = "jruby"
  extra_deps << ["minitest", ">= 1.4.2"]
end

# vim: syntax=Ruby
