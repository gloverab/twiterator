# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'twiterator/version'

Gem::Specification.new do |spec|
  spec.name          = "twiterator"
  spec.version       = Twiterator::VERSION
  spec.authors       = ["Alex Glover"]
  spec.email         = ["alexanderbglover@gmail.com"]

  spec.summary       = %q{Twitter CLI}
  spec.description   = %q{A simple twitter gem that allows you to explore the popular social networking site from the comfort of your command line.}
  spec.homepage      = "https://github.com/gloverab/twiterator"
  spec.license       = "MIT"

  # Prevent pushing this gem to RubyGems.org. To allow pushes either set the 'allowed_push_host'
  # to allow pushing to a single host or delete this section to allow pushing to any host.

  # if spec.respond_to?(:metadata)
  #   spec.metadata['allowed_push_host'] = "TODO: Set to 'http://RubyGems.org'"
  # else
  #   raise "RubyGems 2.0 or newer is required to protect against " \
  #     "public gem pushes."
  # end

  spec.files         = `git ls-files -z`.split("\x0").reject do |f|
    f.match(%r{^(test|spec|features)/})
  end

  spec.executables   << "twiterator"
  spec.require_paths = ["lib", 'lib/twiterator']

  spec.add_dependency 'nokogiri', '1.7.0'

  spec.add_development_dependency "bundler", "~> 1.14"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec", "~> 3.0"
end
