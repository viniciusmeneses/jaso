# frozen_string_literal: true

module Jaso::Core
  require_relative "attributable"
  require_relative "callable"
  require_relative "configurable"
  require_relative "finished"
  require_relative "not_finished"
  require_relative "result"


  def self.included(base)
    base.include(Jaso::Attributable)
    base.include(Jaso::Callable)
    base.private_class_method :new
  end

  def initialize(inputs = {})
    @__inputs = inputs
  end

  def success!(**data)
    result = Jaso::Result.new(Jaso::Result::SUCCESS, data)
    raise Jaso::Finished, result
  end

  def failure!(**data)
    result = Jaso::Result.new(Jaso::Result::FAILURE, data)
    raise Jaso::Finished, result
  end
end
