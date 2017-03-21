# -*- encoding: utf-8 -*-
# stub: coveralls 0.7.9 ruby lib

Gem::Specification.new do |s|
  s.name = "coveralls".freeze
  s.version = "0.7.9"

  s.required_rubygems_version = Gem::Requirement.new(">= 0".freeze) if s.respond_to? :required_rubygems_version=
  s.require_paths = ["lib".freeze]
  s.authors = ["Nick Merwin".freeze, "Wil Gieseler".freeze]
  s.date = "2015-02-03"
  s.description = "A Ruby implementation of the Coveralls API.".freeze
  s.email = ["nick@lemurheavy.com".freeze, "supapuerco@gmail.com".freeze]
  s.executables = ["coveralls".freeze]
  s.files = ["bin/coveralls".freeze]
  s.homepage = "https://coveralls.io".freeze
  s.licenses = ["MIT".freeze]
  s.rubygems_version = "2.6.10".freeze
  s.summary = "A Ruby implementation of the Coveralls API.".freeze

  s.installed_by_version = "2.6.10" if s.respond_to? :installed_by_version

  if s.respond_to? :specification_version then
    s.specification_version = 4

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<rest-client>.freeze, ["~> 1.7"])
      s.add_runtime_dependency(%q<term-ansicolor>.freeze, ["~> 1.3"])
      s.add_runtime_dependency(%q<multi_json>.freeze, ["~> 1.10"])
      s.add_runtime_dependency(%q<thor>.freeze, ["~> 0.19.1"])
      s.add_runtime_dependency(%q<simplecov>.freeze, ["~> 0.9.1"])
      s.add_development_dependency(%q<rspec>.freeze, ["~> 3.1"])
      s.add_development_dependency(%q<rake>.freeze, ["~> 10.4"])
      s.add_development_dependency(%q<webmock>.freeze, ["~> 1.20"])
      s.add_development_dependency(%q<vcr>.freeze, ["~> 2.9"])
    else
      s.add_dependency(%q<rest-client>.freeze, ["~> 1.7"])
      s.add_dependency(%q<term-ansicolor>.freeze, ["~> 1.3"])
      s.add_dependency(%q<multi_json>.freeze, ["~> 1.10"])
      s.add_dependency(%q<thor>.freeze, ["~> 0.19.1"])
      s.add_dependency(%q<simplecov>.freeze, ["~> 0.9.1"])
      s.add_dependency(%q<rspec>.freeze, ["~> 3.1"])
      s.add_dependency(%q<rake>.freeze, ["~> 10.4"])
      s.add_dependency(%q<webmock>.freeze, ["~> 1.20"])
      s.add_dependency(%q<vcr>.freeze, ["~> 2.9"])
    end
  else
    s.add_dependency(%q<rest-client>.freeze, ["~> 1.7"])
    s.add_dependency(%q<term-ansicolor>.freeze, ["~> 1.3"])
    s.add_dependency(%q<multi_json>.freeze, ["~> 1.10"])
    s.add_dependency(%q<thor>.freeze, ["~> 0.19.1"])
    s.add_dependency(%q<simplecov>.freeze, ["~> 0.9.1"])
    s.add_dependency(%q<rspec>.freeze, ["~> 3.1"])
    s.add_dependency(%q<rake>.freeze, ["~> 10.4"])
    s.add_dependency(%q<webmock>.freeze, ["~> 1.20"])
    s.add_dependency(%q<vcr>.freeze, ["~> 2.9"])
  end
end
