# frozen_string_literal: true

module Jaso::Attributable
  def self.included(base)
    base.extend(ClassMethods)
    base.prepend(PrependMethods)
  end

  module ClassMethods
    private

    def attributes
      @attributes ||= {}
    end

    def attribute(name, **options)
      attributes[name] = options
      private define_method(name) { attributes[name] }
    end
  end

  module PrependMethods
    def __call
      assign_attributes
      super
    end
  end

  private

  def attributes
    @attributes ||= {}
  end

  def assign_attributes
    self.class.send(:attributes).each do |name, options|
      input = @inputs[name]
      default = options[:default]
      transform = options[:transform]

      attributes[name] = if @inputs.key?(name)
        transform.is_a?(Proc) ? transform.call(input) : input
      else
        default.is_a?(Proc) ? default.call : default
      end
    end
  end
end
