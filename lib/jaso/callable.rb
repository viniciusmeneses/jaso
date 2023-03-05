# frozen_string_literal: true

module Jaso::Callable
  def self.included(base)
    base.extend(ClassMethods)
    base.private_class_method :new
  end

  module ClassMethods
    def call(**inputs)
      new(inputs).__call
    end
  end

  private

  def __call
    call
    raise Jaso::NotFinished
  rescue Jaso::Finished => wrapper
    wrapper.result
  end
end
