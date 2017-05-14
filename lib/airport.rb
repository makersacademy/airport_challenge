require_relative 'plane'
require_relative 'weather'

class Airport
  DEFAULT_HANGAR_SIZE = 10
  attr_accessor :capacity

  def initialize(capacity = DEFAULT_HANGAR_SIZE)
    @planes = []
    @capacity = capacity
    @weather = Weather.new
  end

  def authorize_landing(plane)
    raise "Airport full! Landing not allowed!" if full?
    raise "Airport temporarly closed due to bad weather" unless check_weather
    @planes << plane
  end

  def authorize_take_off(plane)
    raise 'No planes currently available' if empty?
    raise "Airport temporarly closed due to bad weather" unless check_weather
    @planes.delete(plane)
  end

  private

  attr_reader :planes, :weather

  def check_weather
    @weather.clear?
  end

  def empty?
    @planes.empty?
  end

  def full?
    @planes.size >= @capacity
  end

end
