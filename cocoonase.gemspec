# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'cocoonase/version'

Gem::Specification.new do |spec|
  spec.name          = "cocoonase"
  spec.version       = Cocoonase::VERSION
  spec.authors       = ["nickl-"]
  spec.email         = ["github@jigsoft.co.za"]
  spec.summary       = %q{Rails scaffold generator enhancements and cocoon, inherited resources, simple form, active model serializers and bootstrap companion.}
  spec.description   = %q{The best topping for turning your cocoon app into a butterfly.
Generate rails scaffold with full has_one, has_many and habtm associations and hierarchical model support for forms through
cocoon and serialization through active model serializers. Controllers from inherited resources, models with has scope,
pagination in kaminari, css framework bootstrap with many additional simple form input types like date ond time pickers
wysiwyg textareas, switch radio buttons, currency field, mobile fax and telephone number fields, and many more, all
intuitively assumed from field names but easily modifiable. Using show for as display engine to be logically similar to
the forms. Generates modular templates with separate display, capture and list files for every associated model that can
easily be interchanged. All dependencies, gems and client side components are already included.}
  spec.homepage      = "http://github.com/nickl-/cocoonase"
  spec.license       = "BSD 3-Clause"

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) unless f ~= /patches/ }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_dependency 'cocoon', '1.2.1'
  spec.add_dependency 'simple_form', '3.0.1'
  spec.add_dependency 'show_for', '0.3.0.rc'
  spec.add_dependency 'active_model_serializers', '0.8.1' #, '0.9.0.alpha1'
  spec.add_dependency 'inherited_resources', '1.4.1'
#  spec.add_dependency 'responders', '1.0.0.rc'
#  spec.add_dependency 'desponders', '0.3.0'
  spec.add_dependency 'has_scope', '0.6.0.rc'
  spec.add_dependency 'carrierwave', '0.9.0'
  spec.add_dependency 'country_select', '1.2.0'
#  spec.add_dependency 'tabulous', '2.1.0'
  spec.add_dependency 'kaminari', '0.15.0'
#spec.add_dependency 'ar-audit-tracer', '2.0.0'
#  spec.add_dependency 'paper_trail', '3.0.0'
  spec.add_dependency 'haml-rails', '0.5.3'
#  spec.add_dependency 'ruby-haml-js', '0.0.5'

#  spec.add_development_dependency 'rails', '4.0.2'
#  spec.add_development_dependency 'actionpack',  '4.0.2'
#  spec.add_development_dependency 'generator_spec'
#  spec.add_development_dependency "bundler", "1.5"
#  spec.add_development_dependency "rake"
#  spec.add_development_dependency "jeweler", "2.0.0"
#  spec.add_development_dependency "yard", "0.7"
#  spec.add_development_dependency "reek", "1.2.8"
#  spec.add_development_dependency "roodi", "2.1.0"

end
