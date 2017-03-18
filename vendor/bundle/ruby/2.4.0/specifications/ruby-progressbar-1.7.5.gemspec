# -*- encoding: utf-8 -*-
# stub: ruby-progressbar 1.7.5 ruby lib

Gem::Specification.new do |s|
  s.name = "ruby-progressbar".freeze
  s.version = "1.7.5"

  s.required_rubygems_version = Gem::Requirement.new(">= 0".freeze) if s.respond_to? :required_rubygems_version=
  s.require_paths = ["lib".freeze]
  s.authors = ["thekompanee".freeze, "jfelchner".freeze]
  s.date = "2015-03-25"
  s.description = "Ruby/ProgressBar is an extremely flexible text progress bar library for Ruby.\nThe output can be customized with a flexible formatting system including:\npercentage, bars of various formats, elapsed time and estimated time remaining.\n".freeze
  s.email = "support@thekompanee.com".freeze
  s.homepage = "https://github.com/jfelchner/ruby-progressbar".freeze
  s.licenses = ["MIT".freeze]
  s.rubygems_version = "2.6.10".freeze
  s.summary = "Ruby/ProgressBar is a flexible text progress bar library for Ruby.".freeze

  s.installed_by_version = "2.6.10" if s.respond_to? :installed_by_version

  if s.respond_to? :specification_version then
    s.specification_version = 4

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_development_dependency(%q<rspec>.freeze, ["~> 3.1"])
      s.add_development_dependency(%q<rspectacular>.freeze, ["~> 0.21.6"])
      s.add_development_dependency(%q<fuubar>.freeze, ["~> 2.0"])
      s.add_development_dependency(%q<warning_filter>.freeze, ["~> 0.0.2"])
      s.add_development_dependency(%q<timecop>.freeze, ["~> 0.6.0"])
      s.add_development_dependency(%q<codeclimate-test-reporter>.freeze, ["~> 0.3.0"])
    else
      s.add_dependency(%q<rspec>.freeze, ["~> 3.1"])
      s.add_dependency(%q<rspectacular>.freeze, ["~> 0.21.6"])
      s.add_dependency(%q<fuubar>.freeze, ["~> 2.0"])
      s.add_dependency(%q<warning_filter>.freeze, ["~> 0.0.2"])
      s.add_dependency(%q<timecop>.freeze, ["~> 0.6.0"])
      s.add_dependency(%q<codeclimate-test-reporter>.freeze, ["~> 0.3.0"])
    end
  else
    s.add_dependency(%q<rspec>.freeze, ["~> 3.1"])
    s.add_dependency(%q<rspectacular>.freeze, ["~> 0.21.6"])
    s.add_dependency(%q<fuubar>.freeze, ["~> 2.0"])
    s.add_dependency(%q<warning_filter>.freeze, ["~> 0.0.2"])
    s.add_dependency(%q<timecop>.freeze, ["~> 0.6.0"])
    s.add_dependency(%q<codeclimate-test-reporter>.freeze, ["~> 0.3.0"])
  end
end
