# coding: utf-8
m = Module.new do
  module self::Anonymous
    lib = File.expand_path('../lib', __FILE__)
    eval File.read "#{lib}/aws/ssm/console/version.rb"
  end
end

Gem::Specification.new do |spec|
  spec.name          = 'aws-ssm-console'
  spec.version       = m::Anonymous::Aws::SSM::Console::VERSION
  spec.authors       = ['koshigoe']
  spec.email         = ['koshigoeb@gmail.com']
  spec.license       = 'MIT'

  spec.summary       = 'REPL for AWS SSM.'
  spec.description   = 'REPL for AWS SSM.'
  spec.homepage      = 'https://github.com/koshigoe/aws-ssm-console'

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = 'exe'
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ['lib']

  spec.add_development_dependency 'bundler', '~> 1.12'
  spec.add_development_dependency 'rake', '~> 10.0'
  spec.add_development_dependency 'rspec', '~> 3.0'

  spec.add_dependency 'aws-sdk', '~> 2.6'
end
