# coding: utf-8
require File.expand_path('../lib/omniauth-baidu-oauth2/version', __FILE__)

Gem::Specification.new do |spec|
  spec.name          = "omniauth-baidu-oauth2"
  spec.version       = OmniAuth::BaiduOauth2::VERSION
  spec.authors       = ["gengda"]
  spec.email         = ["tony.keng@aliyun.com"]
  spec.description   = %q{OmniAuth Oauth2 strategy for baidu.com}
  spec.summary       = %q{OmniAuth Oauth2 strategy for baidu.com}
  spec.homepage      = "https://github.com/Tonykeng/omniauth-baidu-oauth2"

  spec.files         = `git ls-files`.split("\n")
  spec.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  spec.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  spec.require_paths = ["lib"]

  spec.add_dependency 'omniauth', '~> 1.0'
  spec.add_dependency 'omniauth-oauth2', '~> 1.0'
end
