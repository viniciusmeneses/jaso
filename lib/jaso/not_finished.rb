# frozen_string_literal: true

class Jaso::NotFinished < StandardError
  def initialize(msg = "Must call either success! or failure! at least once")
    super(msg)
  end
end
