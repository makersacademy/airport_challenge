require_relative 'weather'

class Airport
  DEFAULT_CAPACITY = 20
  attr_reader :name, :capacity

  def initialize(name, opts = {})
    @name = name
    @planes = []
    @capacity = opts[:capacity] || DEFAULT_CAPACITY
    @weather = opts[:weather] || Weather.new
  end

  def count
    @planes.size
  end

  def accept plane
    return false if full?
    return false if @weather.stormy?

    @planes << plane
    true
  end

  def take_off_slot plane
    return false if @weather.stormy?

    @planes.delete plane
    true
  end

  private

  def full?
    @planes.size >= @capacity
  end
end
