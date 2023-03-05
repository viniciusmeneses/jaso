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
end
