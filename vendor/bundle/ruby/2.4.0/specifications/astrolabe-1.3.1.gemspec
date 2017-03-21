# -*- encoding: utf-8 -*-
# stub: astrolabe 1.3.1 ruby lib

Gem::Specification.new do |s|
  s.name = "astrolabe".freeze
  s.version = "1.3.1"

  s.required_rubygems_version = Gem::Requirement.new(">= 0".freeze) if s.respond_to? :required_rubygems_version=
  s.require_paths = ["lib".freeze]
  s.authors = ["Yuji Nakayama".freeze]
  s.date = "2015-07-12"
  s.description = "An object-oriented AST extension for Parser".freeze
  s.email = ["nkymyj@gmail.com".freeze]
  s.homepage = "https://github.com/yujinakayama/astrolabe".freeze
  s.licenses = ["MIT".freeze]
  s.rubygems_version = "2.6.10".freeze
  s.summary = "An object-oriented AST extension for Parser".freeze

  s.installed_by_version = "2.6.10" if s.respond_to? :installed_by_version

  if s.respond_to? :specification_version then
    s.specification_version = 4

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<parser>.freeze, ["~> 2.2"])
      s.add_development_dependency(%q<bundler>.freeze, ["~> 1.6"])
      s.add_development_dependency(%q<rake>.freeze, ["~> 10.3"])
      s.add_development_dependency(%q<yard>.freeze, ["~> 0.8"])
      s.add_development_dependency(%q<rspec>.freeze, ["~> 3.0"])
      s.add_development_dependency(%q<fuubar>.freeze, ["~> 2.0.0.rc1"])
      s.add_development_dependency(%q<simplecov>.freeze, ["~> 0.7"])
      s.add_development_dependency(%q<rubocop>.freeze, ["~> 0.24"])
      s.add_development_dependency(%q<guard-rspec>.freeze, ["< 5.0", ">= 4.2.3"])
      s.add_development_dependency(%q<guard-rubocop>.freeze, ["~> 1.0"])
      s.add_development_dependency(%q<ruby_gntp>.freeze, ["~> 0.3"])
    else
      s.add_dependency(%q<parser>.freeze, ["~> 2.2"])
      s.add_dependency(%q<bundler>.freeze, ["~> 1.6"])
      s.add_dependency(%q<rake>.freeze, ["~> 10.3"])
      s.add_dependency(%q<yard>.freeze, ["~> 0.8"])
      s.add_dependency(%q<rspec>.freeze, ["~> 3.0"])
      s.add_dependency(%q<fuubar>.freeze, ["~> 2.0.0.rc1"])
      s.add_dependency(%q<simplecov>.freeze, ["~> 0.7"])
      s.add_dependency(%q<rubocop>.freeze, ["~> 0.24"])
      s.add_dependency(%q<guard-rspec>.freeze, ["< 5.0", ">= 4.2.3"])
      s.add_dependency(%q<guard-rubocop>.freeze, ["~> 1.0"])
      s.add_dependency(%q<ruby_gntp>.freeze, ["~> 0.3"])
    end
  else
    s.add_dependency(%q<parser>.freeze, ["~> 2.2"])
    s.add_dependency(%q<bundler>.freeze, ["~> 1.6"])
    s.add_dependency(%q<rake>.freeze, ["~> 10.3"])
    s.add_dependency(%q<yard>.freeze, ["~> 0.8"])
    s.add_dependency(%q<rspec>.freeze, ["~> 3.0"])
    s.add_dependency(%q<fuubar>.freeze, ["~> 2.0.0.rc1"])
    s.add_dependency(%q<simplecov>.freeze, ["~> 0.7"])
    s.add_dependency(%q<rubocop>.freeze, ["~> 0.24"])
    s.add_dependency(%q<guard-rspec>.freeze, ["< 5.0", ">= 4.2.3"])
    s.add_dependency(%q<guard-rubocop>.freeze, ["~> 1.0"])
    s.add_dependency(%q<ruby_gntp>.freeze, ["~> 0.3"])
  end
end
