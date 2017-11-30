
lib = File.expand_path("../lib", __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "coinmarketcap/wrapper/version"

Gem::Specification.new do |spec|
  spec.name          = "coinmarketcap-wrapper"
  spec.version       = Coinmarketcap::Wrapper::VERSION
  spec.authors       = ["Cyrus Ghazanfar"]
  spec.email         = ["cghazanfar10@gmail.com"]

  spec.summary       = %q{API wrapper for coinmarketcap.com}
  spec.description   = %q{Get's ticker data from Coinmarketcap}
  spec.homepage      = "https://rubygems.org/gems/coinmarketcap-wrapper"
  spec.license       = "MIT"

  # Prevent pushing this gem to RubyGems.org. To allow pushes either set the 'allowed_push_host'
  # to allow pushing to a single host or delete this section to allow pushing to any host.
  # if spec.respond_to?(:metadata)
  #   spec.metadata["allowed_push_host"] = "TODO: Set to 'http://mygemserver.com'"
  # else
  #   raise "RubyGems 2.0 or newer is required to protect against " \
  #     "public gem pushes."
  # end

  spec.files         = `git ls-files -z`.split("\x0").reject do |f|
    f.match(%r{^(test|spec|features)/})
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.16"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "minitest", "~> 5.0"
  spec.add_development_dependency "vcr",  '~> 3.0', '>= 3.0.3'
  spec.add_development_dependency "webmock",  '~> 3.1', '>= 3.1.1'

  spec.add_dependency "faraday", '~> 0.13.1'
  spec.add_dependency "json", '~> 2.1'
end
