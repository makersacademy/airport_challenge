require_relative 'plane'
require_relative 'weather'
class Airport
  DEFAULT_CAPACITY = 20
  attr_reader :capacity
  def initialize(capacity = DEFAULT_CAPACITY)
    @planes = []
    @capacity = capacity
    @weather = Weather.new
  end
	def take_off
    #raise "Oh no! No bikes available!" if empty?
    fail 'The plane cannot fly due to bad weather conditions' if @weather.stormy?
    @planes.pop
	end
  def empty?
    @planes.empty?
  end
  def full?
    @planes.count >= @capacity
  end
	def land(plane)
    fail 'Airport is full. The plane cannot land' if full?
    fail 'The plane cannot land due to bad weather conditions' if @weather.stormy?
    @planes << plane
    #puts "The plane has landed"
	end
	attr_reader :plane
  private :empty?, :full?
end
