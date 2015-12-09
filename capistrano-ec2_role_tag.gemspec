lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'capistrano/ec2_role_tag/version'

Gem::Specification.new do |spec|

  spec.platform      = Gem::Platform::RUBY
  spec.name          = 'capistrano-ec2_role_tag'
  spec.version       = Capistrano::Ec2RoleTag::VERSION
  spec.summary       = "Capistrano plugin to dynamically load server by AWS EC2 role"
  spec.description   = "Capistrano plugin to dynamically load server by AWS EC2 role. \
  Support a helper in capistrano deploy stage configuration file to get internal dns name by role and stage."

  spec.required_ruby_version     = '>= 2'
  spec.required_rubygems_version = '>= 1.8.0'

  spec.license       = 'MIT'

  spec.authors       = ['An Vo Nguyen Thien']
  spec.email         = ['an.vo@codebox.vn']
  spec.homepage      = 'https://github.com/heosuax/capistrano-ec2_role_tag'

  spec.require_paths = ['lib']
  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})

  spec.add_development_dependency 'bundler', '~> 1.3', '>= 1.3.5'
  spec.add_development_dependency 'rake', '~> 10.0', '>= 10.0.0'
  spec.add_development_dependency 'rspec', '~> 2.14', '>= 2.14.1'
  spec.add_development_dependency 'rubygems-tasks', '~> 0.2', '>= 0.2.4'

  spec.add_runtime_dependency 'aws-sdk', '~> 2'
  spec.add_runtime_dependency 'capistrano', '~> 3'
end
