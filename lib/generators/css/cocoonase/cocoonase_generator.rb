require "rails/generators/named_base"

module Css
  module Generators
    #Rails::Generators.hidden_namespaces << 'css:cocoonase'
    class CocoonaseGenerator < Rails::Generators::NamedBase
      class_option :skip_bootstrap, :type => :boolean, :default => true,
                   :desc => "Skip installing bootstrap when found. Use --no-skip-bootstrap instead."

      def copy_stylesheet
        path = File.expand_path('../../../../../app/assets', __FILE__);
        if Dir.glob("#{path}/bootstrap*").blank? || options[:skip_bootstrap] == false
          get 'https://raw.github.com/jasny/bootstrap/v3.0.1-p7/dist/js/bootstrap.min.js',
              "#{path}/javascripts/bootstrap.js"
          get 'https://raw.github.com/jasny/bootstrap/v3.0.1-p7/dist/css/bootstrap.min.css',
              "#{path}/stylesheets/bootstrap.css"
          get 'https://raw.github.com/jasny/bootstrap/v3.0.1-p7/dist/css/bootstrap-theme.min.css',
              "#{path}/stylesheets/bootstrap-theme.css"
          get 'https://raw.github.com/jasny/bootstrap/v3.0.1-p7/dist/fonts/glyphicons-halflings-regular.eot',
              "#{path}/fonts/glyphicons-halflings-regular.eot"
          get 'https://raw.github.com/jasny/bootstrap/v3.0.1-p7/dist/fonts/glyphicons-halflings-regular.woff',
              "#{path}/fonts/glyphicons-halflings-regular.woff"
          get 'https://raw.github.com/jasny/bootstrap/v3.0.1-p7/dist/fonts/glyphicons-halflings-regular.ttf',
              "#{path}/fonts/glyphicons-halflings-regular.ttf"
          get 'https://raw.github.com/jasny/bootstrap/v3.0.1-p7/dist/fonts/glyphicons-halflings-regular.svg',
              "#{path}/fonts/glyphicons-halflings-regular.svg"
          get 'https://raw.github.com/FortAwesome/Font-Awesome/v4.0.3/css/font-awesome.min.css',
              "#{path}/stylesheets/font-awesome.css"
          get 'https://raw.github.com/FortAwesome/Font-Awesome/v4.0.3/fonts/fontawesome-webfont.eot',
              "#{path}/fonts/fontawesome-webfont.eot"
          get 'https://raw.github.com/FortAwesome/Font-Awesome/v4.0.3/fonts/fontawesome-webfont.woff',
              "#{path}/fonts/fontawesome-webfont.woff"
          get 'https://raw.github.com/FortAwesome/Font-Awesome/v4.0.3/fonts/fontawesome-webfont.ttf',
              "#{path}/fonts/fontawesome-webfont.ttf"
          get 'https://raw.github.com/FortAwesome/Font-Awesome/v4.0.3/fonts/fontawesome-webfont.svg',
              "#{path}/fonts/fontawesome-webfont.svg"
          get 'https://raw.github.com/abilian/bootstrap-timepicker/3.x/js/bootstrap-timepicker.min.js',
              "#{path}/javascripts/bootstrap-timepicker.js"
          get 'https://raw.github.com/abilian/bootstrap-timepicker/3.x/css/bootstrap-timepicker.min.css',
              "#{path}/stylesheets/bootstrap-timepicker.css"
          get 'https://raw.github.com/smalot/bootstrap-datetimepicker/2.2.0/js/bootstrap-datetimepicker.min.js',
              "#{path}/javascripts/bootstrap-datetimepicker.js"
          get 'https://raw.github.com/smalot/bootstrap-datetimepicker/2.2.0/css/bootstrap-datetimepicker.min.css',
              "#{path}/stylesheets/bootstrap-datetimepicker.css"
          get 'https://raw.github.com/nostalgiaz/bootstrap-switch/v2.0.0/build/js/bootstrap-switch.min.js',
              "#{path}/javascripts/bootstrap-switch.js"
          get 'https://raw.github.com/nostalgiaz/bootstrap-switch/v2.0.0/build/css/bootstrap3/bootstrap-switch.min.css',
              "#{path}/stylesheets/bootstrap-switch.css"
          get 'https://raw.github.com/artillery/bootstrap-wysihtml5/master/dist/bootstrap-wysihtml5-0.0.3.min.js',
              "#{path}/javascripts/bootstrap-wysihtml5.js"
          get 'https://raw.github.com/artillery/bootstrap-wysihtml5/master/dist/bootstrap-wysihtml5-0.0.3.css',
              "#{path}/stylesheets/bootstrap-wysihtml5.css"
          get 'https://raw.github.com/nickl-/pnotify/master/jquery.pnotify.min.js',
              "#{path}/javascripts/jquery.pnotify.js"
          get 'http://cdn.leafletjs.com/leaflet-0.7.1/leaflet.js',
              "#{path}/javascripts/leaflet.js"
          get 'http://cdn.leafletjs.com/leaflet-0.7.1/leaflet.css',
              "#{path}/stylesheets/leaflet.css"
          get 'http://cdn.leafletjs.com/leaflet-0.7.1/images/layers-2x.png',
              "#{path}/stylesheets/images/layers-2x.png"
          get 'http://cdn.leafletjs.com/leaflet-0.7.1/images/layers.png',
              "#{path}/stylesheets/images/layers.png"
          get 'http://cdn.leafletjs.com/leaflet-0.7.1/images/marker-icon-2x.png',
              "#{path}/stylesheets/images/marker-icon-2x.png"
          get 'http://cdn.leafletjs.com/leaflet-0.7.1/images/marker-icon.png',
              "#{path}/stylesheets/images/marker-icon.png"
          get 'http://cdn.leafletjs.com/leaflet-0.7.1/images/marker-shadow.png',
              "#{path}/stylesheets/images/marker-shadow.png"
          get 'https://raw.github.com/kswedberg/jquery-expander/1.4.7/jquery.expander.min.js',
              "#{path}/javascripts/jquery.expander.js"
          get 'https://raw.github.com/ivaynberg/select2/3.4.5/select2.min.js',
              "#{path}/javascripts/select2.js"
          get 'https://raw.github.com/ivaynberg/select2/3.4.5/select2.css',
              "#{path}/stylesheets/select2.css"
          get 'https://raw.github.com/ivaynberg/select2/3.4.5/select2.png',
              "#{path}/stylesheets/select2.png"
          get 'https://raw.github.com/ivaynberg/select2/3.4.5/select2-spinner.gif',
              "#{path}/stylesheets/select2-spinner.gif"
          get 'https://raw.github.com/ivaynberg/select2/3.4.5/select2x2.png',
              "#{path}/stylesheets/select2x2.png"
          get 'https://raw.github.com/t0m/select2-bootstrap-css/bootstrap3/select2-bootstrap.css',
              "#{path}/stylesheets/select2-bootstrap.css"
        else
          say_status :skip,'found bootstrap use --no-skip-bootstrap to install', :yellow
        end
      end
    end
  end
end
