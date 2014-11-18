$:.push File.expand_path("../lib", __FILE__)
require "faker/version"

Gem::Specification.new do |s|
  s.name        = "faker"
  s.version     = Faker::VERSION
  s.platform    = Gem::Platform::RUBY
  s.authors     = ["Navaneethakrishnan"]
  s.email       = ["r.navaneeth@gmail.com"]
  s.homepage    = "https://github.com/rnavaneeth/faker"
  s.summary     = %q{Easily generate fake data}
  s.description = %q{Faker, a fork from Faker gem, is used to easily generate fake data: names, addresses, phone numbers, etc.}
  s.license     = 'MIT'

  s.rubyforge_project = "faker"

  s.add_dependency('i18n', '~> 0.5')

  #s.files         = `git ls-files -- lib/*`.split("\n") + %w(History.txt License.txt README.md)
  s.files         = Dir["{lib}/**/*.rb", "preset_configs/event_sample.yml","bin/*", "LICENSE", "*.md"]
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]
end
