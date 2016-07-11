# -*- encoding: utf-8 -*-
# stub: reek 1.3.8 ruby lib

Gem::Specification.new do |s|
  s.name = "reek"
  s.version = "1.3.8"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.require_paths = ["lib"]
  s.authors = ["Kevin Rutherford", "Timo Roessner", "Matijs van Zuijlen"]
  s.date = "2014-07-07"
  s.description = "Reek is a tool that examines Ruby classes, modules and methods\nand reports any code smells it finds.\n"
  s.email = ["timo.roessner@googlemail.com"]
  s.executables = ["reek"]
  s.extra_rdoc_files = ["CHANGELOG", "License.txt"]
  s.files = ["CHANGELOG", "License.txt", "bin/reek"]
  s.homepage = "http://wiki.github.com/troessner/reek"
  s.post_install_message = "Thank you for downloading Reek. For info see the reek wiki http://wiki.github.com/troessner/reek"
  s.rdoc_options = ["--main", "README.md"]
  s.rubyforge_project = "reek"
  s.rubygems_version = "2.4.5.1"
  s.summary = "Code smell detector for Ruby"

  s.installed_by_version = "2.4.5.1" if s.respond_to? :installed_by_version

  if s.respond_to? :specification_version then
    s.specification_version = 4

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<ruby_parser>, ["~> 3.3"])
      s.add_runtime_dependency(%q<sexp_processor>, [">= 0"])
      s.add_runtime_dependency(%q<ruby2ruby>, ["< 3.0", ">= 2.0.8"])
      s.add_runtime_dependency(%q<rainbow>, ["< 3.0", ">= 1.99"])
      s.add_development_dependency(%q<bundler>, ["~> 1.1"])
      s.add_development_dependency(%q<rake>, [">= 0"])
      s.add_development_dependency(%q<cucumber>, [">= 0"])
      s.add_development_dependency(%q<rspec>, ["~> 2.12"])
      s.add_development_dependency(%q<flay>, [">= 0"])
      s.add_development_dependency(%q<yard>, [">= 0"])
    else
      s.add_dependency(%q<ruby_parser>, ["~> 3.3"])
      s.add_dependency(%q<sexp_processor>, [">= 0"])
      s.add_dependency(%q<ruby2ruby>, ["< 3.0", ">= 2.0.8"])
      s.add_dependency(%q<rainbow>, ["< 3.0", ">= 1.99"])
      s.add_dependency(%q<bundler>, ["~> 1.1"])
      s.add_dependency(%q<rake>, [">= 0"])
      s.add_dependency(%q<cucumber>, [">= 0"])
      s.add_dependency(%q<rspec>, ["~> 2.12"])
      s.add_dependency(%q<flay>, [">= 0"])
      s.add_dependency(%q<yard>, [">= 0"])
    end
  else
    s.add_dependency(%q<ruby_parser>, ["~> 3.3"])
    s.add_dependency(%q<sexp_processor>, [">= 0"])
    s.add_dependency(%q<ruby2ruby>, ["< 3.0", ">= 2.0.8"])
    s.add_dependency(%q<rainbow>, ["< 3.0", ">= 1.99"])
    s.add_dependency(%q<bundler>, ["~> 1.1"])
    s.add_dependency(%q<rake>, [">= 0"])
    s.add_dependency(%q<cucumber>, [">= 0"])
    s.add_dependency(%q<rspec>, ["~> 2.12"])
    s.add_dependency(%q<flay>, [">= 0"])
    s.add_dependency(%q<yard>, [">= 0"])
  end
end
