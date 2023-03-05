# frozen_string_literal: true

class Jaso::Finished < StandardError
  attr_reader :result

  def initialize(result)
    @result = result
    super
  end
end
