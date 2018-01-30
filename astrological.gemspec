
lib = File.expand_path("../lib", __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "astrological/version"

Gem::Specification.new do |spec|
  spec.name          = "astrological"
  spec.version       = Astrological::VERSION
  spec.authors       = ["'Andy Maskiell'"]
  spec.email         = ["'maskiella@gmail.com'"]

  spec.summary       = %q{A Gem which helps a user find info about a given astrological sign through a CLI}
  spec.description   = %q{Once a user has chosen about which astrological sign they would like more info, they will then be prompted about whether they would like a daily/weekly/monthly/yearly reading, and then scrape several websites for relevant information, as well as returning the URLs for each so that they may further browse a referenced web page}
  spec.homepage      = "https://github.com/saurookadook/astrological-cli-app.git"
  spec.license       = 'MIT'

  # Prevent pushing this gem to RubyGems.org. To allow pushes either set the 'allowed_push_host'
  # to allow pushing to a single host or delete this section to allow pushing to any host.
  # if spec.respond_to?(:metadata)
  #   spec.metadata["https://rubygems.org"] = "https://rubygems.org"
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
  spec.add_development_dependency "rspec", ">= 0"
  spec.add_runtime_dependency "nokogiri", ">= 0"
  spec.add_development_dependency "pry", ">= 0"
end
