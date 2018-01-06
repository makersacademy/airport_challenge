
class Airport
  attr_reader :airport, :plane

  def initialize(storage = [])
    @storage = storage
  end

  def land(plane)
    raise "Storm, wait until it's clear!!" if check_stormy
    raise "The airport is full!" if full?
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

end
