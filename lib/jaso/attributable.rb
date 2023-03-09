# frozen_string_literal: true

module Jaso::Attributable
  def self.included(base)
    base.extend(ClassMethods)
    base.prepend(PrependMethods)
  end

  module ClassMethods
    def __attributes
      @__attributes ||= {}
    end

    def attribute(name, **options)
      __attributes[name] = options
      private define_method(name) { __attributes[name] }
    end
  end

  module PrependMethods
    def __call
      __assign_attributes
      super
    end
  end

  def __attributes
    @__attributes ||= {}
  end

  def __assign_attributes
    self.class.__attributes.each do |name, options|
      input = @__inputs[name]
      default = options[:default]
      transform = options[:transform]

      __attributes[name] = if @__inputs.key?(name)
        transform.is_a?(Proc) ? transform.call(input) : input
      else
        default.is_a?(Proc) ? default.call : default
      end
    end
  end
end
