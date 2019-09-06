module QryFilter

  class FilterClassFinder
    def initialize(scope)
      @scope = scope
    end

    def filter_class
      klass = find(@scope)
      klass.is_a?(String) ? klass.safe_constantize : klass
    end

    private

    def find(subject)
      if subject.is_a?(Array)
        modules = subject.dup
        last = modules.pop
        context = modules.map { |x| find_class_name(x) }.join("::")
        [context, find(last)].join("::")
      else
        class_name = find_class_name(subject)
        "#{class_name}Filter"
      end
    end

    def find_class_name(subject)
      if subject.respond_to?(:model_name)
        subject.model_name
      elsif subject.class.respond_to?(:model_name)
        subject.class.model_name
      elsif subject.is_a?(Class)
        subject
      elsif subject.is_a?(Symbol)
        subject.to_s.camelize
      else
        subject.class
      end
    end
  end

end