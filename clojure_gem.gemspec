(in /home/phil/src/clojure-gem)
# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = %q{clojure}
  s.version = "0.5.0"
  s.platform = %q{jruby}

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["Phil Hagelberg"]
  s.date = %q{2009-08-18}
  s.description = %q{Use Clojure's immutable data structures and Software Transactional
Memory from Ruby. Don't be afraid of concurrency.

Requires JRuby. Tested with 1.3.1+.

Supports all four persistent collection types (lists, vectors, maps,
and sets). Many enumerable methods still return Ruby arrays instead of
the original type; this will be fixed. Lazy sequences are not yet
supported.}
  s.email = ["technomancy@gmail.com"]
  s.extra_rdoc_files = ["History.txt", "Manifest.txt"]
  s.files = [".autotest", ".gitignore", "COPYING", "History.txt", "Manifest.txt", "README.rdoc", "Rakefile", "lib/clojure.rb", "lib/clojure/clojure-1.0.0.jar", "lib/clojure/fn.rb", "lib/clojure/lazy_seq.rb", "lib/clojure/list.rb", "lib/clojure/map.rb", "lib/clojure/ref.rb", "lib/clojure/seq.rb", "lib/clojure/set.rb", "lib/clojure/vector.rb", "test/test_helper.rb", "test/test_list.rb", "test/test_map.rb", "test/test_ref.rb", "test/test_set.rb", "test/test_vector.rb", "test/test_namespace.rb"]
  s.homepage = %q{http://github.com/technomancy/clojure-gem}
  s.rdoc_options = ["--main", "README.rdoc"]
  s.require_paths = ["lib"]
  s.rubyforge_project = %q{clojure}
  s.rubygems_version = %q{1.3.5}
  s.summary = %q{Use Clojure's immutable data structures and Software Transactional Memory from Ruby}
  s.test_files = ["test/test_namespace.rb", "test/test_ref.rb", "test/test_map.rb", "test/test_helper.rb", "test/test_vector.rb", "test/test_set.rb", "test/test_list.rb"]

  if s.respond_to? :specification_version then
    current_version = Gem::Specification::CURRENT_SPECIFICATION_VERSION
    s.specification_version = 3

    if Gem::Version.new(Gem::RubyGemsVersion) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<minitest>, [">= 1.4.2"])
      s.add_development_dependency(%q<hoe>, [">= 2.3.3"])
    else
      s.add_dependency(%q<minitest>, [">= 1.4.2"])
      s.add_dependency(%q<hoe>, [">= 2.3.3"])
    end
  else
    s.add_dependency(%q<minitest>, [">= 1.4.2"])
    s.add_dependency(%q<hoe>, [">= 2.3.3"])
  end
end
