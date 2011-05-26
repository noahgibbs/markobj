# -*- encoding: utf-8 -*-
$:.push File.expand_path("./lib", __FILE__)

Gem::Specification.new do |s|
  s.name        = "markobj"
  s.version     = "0.0.1"
  s.platform    = Gem::Platform::RUBY
  s.authors     = ["Noah Gibbs"]
  s.email       = ["noah_gibbs@yahoo.com"]
  s.homepage    = ""
  s.summary     = %q{An object randomizer with versioning}
  s.description = %q{MarkObj allows generating versioned random objects in generations, so that by knowing when a given object was generated and its random seed, you can continue to regenerate the same version of the object over time.}

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]
end
