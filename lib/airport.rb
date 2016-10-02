require_relative 'plane'
class Airport
  DEFAULT_CAPACITY = 20
  attr_reader :capacity, :stormy
  def initialize(capacity = DEFAULT_CAPACITY)
    @planes = []
    @capacity = capacity
    @stormy = true
  end
	def take_off
    #raise "Oh no! No bikes available!" if empty?
#    fail 'The plane cannot fly due to bad weather conditions' if stormy?
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
    #fail 'Airport is full. The plane cannot land' if full?
    @planes << plane
	end
    # def stormy?
    #   @stormy
    # end
	attr_reader :plane
  private :empty?, :full?
end
