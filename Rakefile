require 'rubocop/rake_task'
require 'rspec/core/rake_task'
require "codeclimate-test-reporter"

RuboCop::RakeTask.new :cop
RSpec::Core::RakeTask.new :spec

task default: [:cop, :spec]
