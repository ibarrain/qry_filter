# frozen_string_literal: true

require 'qry_filter/filter_class_finder'

module QryFilter
  class << self
    def compose(scope, filter_hash, filter_class: nil, filter_by: nil)
      if filter_class.nil?
        filter_class = FilterClassFinder.new(scope).filter_class
      end

      filter = filter_class.new(scope, filter_hash)

      execute(filter, filter_by)
    end

    protected

    def execute(filter, filter_by)
      if filter_by.nil?
        filter.send(:default)
      else
        filter_by.each do |subject|
          filter.send("by_#{subject}")
        end
      end

      filter.scope
    end
  end

  def filter(*args)
    QryFilter.compose(*args)
  end
end
