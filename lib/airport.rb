
class Airport
  attr_accessor :capacity

	def initialize(capacity=6)
		@planes = []
		@capacity = capacity
	end

  def approves_landing plane
    fail 'Airport is full' if full?
    planes << plane
  end
  def approves_take_off
    fail 'No planes at airport' if empty?
		planes.pop
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
