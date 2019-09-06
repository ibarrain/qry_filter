module QryFilter
  module Generators
    class InstallGenerator < ::Rails::Generators::Base
      source_root File.expand_path("templates", __dir__)

      def copy_application_filter
        template "application_filter.rb", "app/filters/application_filter.rb"
      end
    end
  end
end