# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'totalvoice'

Gem::Specification.new do |spec|
  spec.name        = 'totalvoice-ruby'
  spec.version     = TotalVoice::VERSION
  spec.authors     = ['DiloWagner']
  spec.email       = 'dx@sendgrid.com'
  spec.summary     = 'Official TotalVoice Gem'
  spec.description = 'Client Official API TotalVoice'
  spec.homepage    = 'http://github.com/totalvoice/totalvoice-ruby'

  spec.required_ruby_version = '>= 2.4'

  spec.license       = 'MIT'
  spec.files         = Dir['lib/**/*.rb']
  spec.require_paths = ['lib']
  spec.add_dependency 'httparty', '0.16.2'
end
