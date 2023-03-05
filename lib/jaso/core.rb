# frozen_string_literal: true

require_relative "finished"
require_relative "result"

module Jaso::Core
  def initialize(inputs = {})
    @inputs = inputs
  end

  # Must be overwritten
  def call
  end

  private

  def success!(**data)
    result = Jaso::Result.new(Jaso::Result::SUCCESS, data)
    raise Jaso::Finished, result
  end

  def failure!(**data)
    result = Jaso::Result.new(Jaso::Result::FAILURE, data)
    raise Jaso::Finished, result
  end
end
