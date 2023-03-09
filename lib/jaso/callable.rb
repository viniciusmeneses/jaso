# frozen_string_literal: true

module Jaso::Callable
  def self.included(base)
    base.extend(ClassMethods)
  end

  module ClassMethods
    def call(**inputs)
      new(inputs).__call
    end
  end

  # Must be overwritten by subclass
  def call
  end

  # Must be overwritten by validator
  def __validate!
  end

  def __call
    __validate!
    call
    raise Jaso::NotFinished
  rescue Jaso::Finished => finished
    finished.result
  end
end
