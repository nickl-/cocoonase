require 'rails/generators/rails/scaffold/scaffold_generator'

module Rails
  module Generators
    class CocoonaseScaffoldGenerator < Rails::Generators::ScaffoldGenerator
      hook_for :stylesheet_engine, as: :cocoonase do |stylesheet_engine|
        invoke stylesheet_engine, [controller_name] if options[:stylesheets] && behavior == :invoke
      end
    end
  end
end
