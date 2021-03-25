# -*- encoding: utf-8 -*-
# stub: simplecov-console 0.6.0 ruby lib

Gem::Specification.new do |s|
  s.name = "simplecov-console".freeze
  s.version = "0.6.0"

  s.required_rubygems_version = Gem::Requirement.new(">= 0".freeze) if s.respond_to? :required_rubygems_version=
  s.require_paths = ["lib".freeze]
  s.authors = ["Chetan Sarva".freeze]
  s.date = "2019-11-08"
  s.description = "Simple console output formatter for SimpleCov".freeze
  s.email = "chetan@pixelcop.net".freeze
  s.extra_rdoc_files = ["LICENSE.txt".freeze, "README.md".freeze]
  s.files = ["LICENSE.txt".freeze, "README.md".freeze]
  s.homepage = "http://github.com/chetan/simplecov-console".freeze
  s.licenses = ["MIT".freeze]
  s.rubygems_version = "3.1.2".freeze
  s.summary = "Simple console output formatter".freeze

  s.installed_by_version = "3.1.2" if s.respond_to? :installed_by_version

  if s.respond_to? :specification_version then
    s.specification_version = 4
  end

  if s.respond_to? :add_runtime_dependency then
    s.add_runtime_dependency(%q<simplecov>.freeze, [">= 0"])
    s.add_runtime_dependency(%q<terminal-table>.freeze, [">= 0"])
    s.add_runtime_dependency(%q<ansi>.freeze, [">= 0"])
    s.add_development_dependency(%q<minitest>.freeze, [">= 0"])
    s.add_development_dependency(%q<yard>.freeze, [">= 0"])
    s.add_development_dependency(%q<bundler>.freeze, ["~> 1.2"])
    s.add_development_dependency(%q<juwelier>.freeze, [">= 0"])
  else
    s.add_dependency(%q<simplecov>.freeze, [">= 0"])
    s.add_dependency(%q<terminal-table>.freeze, [">= 0"])
    s.add_dependency(%q<ansi>.freeze, [">= 0"])
    s.add_dependency(%q<minitest>.freeze, [">= 0"])
    s.add_dependency(%q<yard>.freeze, [">= 0"])
    s.add_dependency(%q<bundler>.freeze, ["~> 1.2"])
    s.add_dependency(%q<juwelier>.freeze, [">= 0"])
  end
end
