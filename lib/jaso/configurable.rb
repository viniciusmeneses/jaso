# frozen_string_literal: true

module Jaso::Configurable
  class Configuration
    attr_accessor :validator

    def validator=(validator)
      raise ArgumentError, "#{validator} is not a Jaso::Validator" unless validator_defined?(validator)
      @validator = validator
    end

    private

    def validator_defined?(validator)
      validator.instance_of?(Module) && validator.to_s.start_with?("Jaso::Validator::")
    end
  end

  def configuration
    @configuration ||= Configuration.new
  end

  def configure
    yield(configuration)
  end

  def inherited(base)
    base.include(configuration.validator) if configuration.validator
  end
end
