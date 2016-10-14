module Aws
  module SSM
    module Console
      GEMSPEC_PATH = File.expand_path('../../../../../aws-ssm-console.gemspec', __FILE__)
      GEMSPEC = Gem::Specification.load(GEMSPEC_PATH)
      VERSION = GEMSPEC.version.to_s.freeze
    end
  end
end
