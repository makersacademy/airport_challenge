require_relative 'planes'

class Airport
  attr_reader :planes

DEFAULT_CAPACITY = 20

  def initialize
    @planes = []
  end

  def take_off
    fail 'No planes available' if empty?
    @planes.pop
  end

  def land(our_plane)
    fail "Airport full" if full?
    @planes.push(our_plane)
    end

    private

    def full?
      @planes.count >= DEFAULT_CAPACITY
    end

    def empty?
      @planes.count < 1
    end

  end
