# frozen_string_literal: true

class Jaso::Result
  attr_reader :data

  SUCCESS = :success
  FAILURE = :failure

  def initialize(type, data = {})
    @type = type
    @data = data
  end

  def success?
    @type == :success
  end

  def failure?
    @type == :failure
  end

  def deconstruct
    [@type, data]
  end

  def deconstruct_keys(keys)
    { type: @type, **data }
  end

  private

  def method_missing(name, *args, &block)
    key = method_name_to_key(name)
    super unless data.key?(key)

    value = name.to_s.end_with?("?") ? !!data[key] : data[key]
    define_singleton_method(name) { value }
    send(name)
  end

  def respond_to_missing?(name, include_private = false)
    key = method_name_to_key(name)
    data.key?(key) || super
  end

  def method_name_to_key(name)
    name.to_s.chomp("?").to_sym
  end
end
