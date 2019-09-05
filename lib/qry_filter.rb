module QryFilter
  class << self

    def compose(scope, filter_hash:, filter_class: nil, filter_by: nil)
      filter = filter_class.new(scope, filter_hash)

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
end
