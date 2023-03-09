# frozen_string_literal: true

module Jaso::Validator
  module ActiveModel
    def self.included(base)
      require "active_model"
      base.include(::ActiveModel::Validations)
      base.define_method(:__validate!) { failure!(errors: errors) if invalid? }
    rescue LoadError
    end
  end
end
