# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "xplosion/version"

Gem::Specification.new do |s|
  s.name        = "xplosion"
  s.version     = Xplosion::VERSION
  s.platform    = Gem::Platform::RUBY
  s.authors     = ["Albert Bellonch", "Marc Pursals"]
  s.email       = ["albert@getquipu.com", "marc@getquipu.com"]
  s.homepage    = "http://getquipu.com"
  s.summary     = %q{An XLS exporter for RAILS}
  s.description = %q{-}
  s.license     = 'MIT'

  s.rubyforge_project = "xplosion"

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.require_paths = ["lib"]
end
