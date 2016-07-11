begin
  require 'reek/rake/task'

  Reek::Rake::Task.new do |t|
    t.fail_on_error = true
    t.verbose = false
    t.reek_opts = '--quiet'
  end
rescue Gem::LoadError
end

begin
  require 'metric_fu'
rescue LoadError
end
