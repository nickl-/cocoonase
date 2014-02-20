require "cocoonase/version"
require 'cocoonase/view_helpers'

module Cocoonase
  extend ActiveSupport::Autoload

  class Engine < ::Rails::Engine

    config.before_initialize do
      #require 'simple_form'
      #Dir[File.expand_path('../../app/inputs/*.rb', __FILE__)].each {|file| require file }
      #require File.expand_path('../active_record/nested_attributes', __FILE__)
      #require File.expand_path('../cocoonase/action_view/helpers/form_helper', __FILE__)

      if config.action_view.javascript_expansions
        config.action_view.javascript_expansions[:cocoonase] = %w(cocoonase)
      end
    end

    # configure our plugin on boot
    initializer "cocoonase.initialize" do |app|
      ActionView::Base.send :include, Cocoonase::ViewHelpers
    end

  end

end
