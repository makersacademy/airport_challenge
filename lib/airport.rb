
class Airport
  attr_reader :airport, :plane, :default_capacity, :default_airport


  DEFAULT_CAPACITY = 20

  def initialize(storage = [], default_capacity = DEFAULT_CAPACITY)
    @storage = storage
    @default_capacity = default_capacity
    @default_airport = default_airport
  end

  def land(plane)
    raise "Storm, wait until it's clear!!" if check_stormy
    raise "The airport is full!" if full?
    raise "Airport capacity reached!" if capacity?
    @storage.push(plane)
  end

  def take_off(*)
    raise "Storm, wait until it's clear!" if check_stormy
    @storage.delete_at(@storage.length - 1)
  end

  def show_planes
    @storage
  end

  def check_stormy
    Weather.new.stormy?
  end

  def full?
  end

  def capacity?
   return if @storage.length >= @default_capacity
  end
end
