require 'rake'
require 'rspec/core/rake_task'

RSpec::Core::RakeTask.new(:spec) do |task|
  task.pattern = Dir.glob('spec/**/*_spec.rb')
  task.rspec_opts = '--format documenation'
end

task default: :spec
