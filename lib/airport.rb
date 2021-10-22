require_relative "plane"
require_relative "weather"

class Airport
  DEFAULT_CAPACITY = 20

  attr_reader :capacity

  def initialize(arg_cap = nil)
    @hanger = []
    update_capacity(arg_cap)
  end

  def update_capacity(arg_cap = nil)
    fail fail_message_cap if invalid_cap?(arg_cap)
    @capacity = arg_cap ? arg_cap.to_i : DEFAULT_CAPACITY
  end

  private

  def invalid_cap?(v)
    return false if v.nil?
    return true if cant_convert_to_int(v)
    v.to_i.zero?
  end

  def cant_convert_to_int(v) !(v.respond_to? :to_i) end

  def fail_message_cap 
    'Capacity must be a numerical value (e.g. 10, 10.0, "10") > 0'
  end
end
