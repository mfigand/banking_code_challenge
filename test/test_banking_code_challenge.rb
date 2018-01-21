require 'rubygems'
require 'rspec'

Dir["./lib/*.rb"].each {|file| require File.expand_path('../../'+file, __FILE__)}
