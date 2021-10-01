require "simplecov"
require "simplecov-console"

SimpleCov.formatter = SimpleCov::Formatter::MultiFormatter.new([
  SimpleCov::Formatter::Console,
# Want a nice code coverage website? Uncomment this next line!
# SimpleCov::Formatter::HTMLFormatter
])
SimpleCov.start

RSpec.configure do |config|
  config.after(:suite) do
    puts
    puts "\e[33mHave you considered running rubocop? It will help you improve your code!\e[0m"
    puts "\e[33mTry it now! Just run: rubocop\e[0m"

    update_readme
  end
end

def update_readme
  lines = File.readlines("README.md")

  json_file = File.read("./coverage/.last_run.json")
  result_json = JSON.parse(json_file)

  coverage = result_json["result"]["line"]
  new_status = "[![Coverage Status]" \
  "(https://img.shields.io/badge/coverage-#{coverage}%25-brightgreen)]" \
  "(https:/github.com/feedXia/)\n"

  lines[0] = new_status
  File.open("README.md", "w") { |f| f.write(lines.join) }

  return
end
