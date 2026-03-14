# frozen_string_literal: true

require_relative 'lib/legion/extensions/cognitive_cocoon/version'

Gem::Specification.new do |spec|
  spec.name          = 'lex-cognitive-cocoon'
  spec.version       = Legion::Extensions::CognitiveCocoon::VERSION
  spec.authors       = ['Esity']
  spec.email         = ['matthewdiverson@gmail.com']
  spec.summary       = 'Protective encapsulation of fragile ideas during development for LegionIO agents'
  spec.description   = 'Models cognitive cocooning — fragile ideas enter protective shells, gestate ' \
                       'at complexity-appropriate rates, and emerge transformed. Premature exposure risks idea death.'
  spec.homepage      = 'https://github.com/LegionIO/lex-cognitive-cocoon'
  spec.license       = 'MIT'
  spec.required_ruby_version = '>= 3.4'

  spec.metadata = {
    'homepage_uri'          => spec.homepage,
    'source_code_uri'       => spec.homepage,
    'documentation_uri'     => "#{spec.homepage}/blob/master/README.md",
    'changelog_uri'         => "#{spec.homepage}/blob/master/CHANGELOG.md",
    'bug_tracker_uri'       => "#{spec.homepage}/issues",
    'rubygems_mfa_required' => 'true'
  }

  spec.files = Dir.chdir(__dir__) { `git ls-files -z`.split("\x0") }
  spec.require_paths = ['lib']
end
