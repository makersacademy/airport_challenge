require_relative 'weather'
require_relative 'plane'

class Airport
	attr_writer :capacity
  DEFAULT_CAPACITY = 5

  def full
    plane.length >= @capacity
  end

  def ok
    true
  end

  def runway
    @runway ||= []
  end
end
