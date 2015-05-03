
class Airport
  attr_accessor :capacity

	def initialize(capacity=6)
		@planes = []
		@capacity = capacity
	end

  def land plane
    fail 'Airport is full' if full?
    planes << plane
  end
  def take_off
  end
  def stormy?
    false
  end

  private

	attr_reader :planes

	def full?
		planes.count >= capacity
	end

	def empty?
		planes.empty?
	end
end
