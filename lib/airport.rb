require_relative 'plane'

class Airport
  attr_accessor :capacity

  def initialize capacity
    @capacity = capacity
  end

  DEFAULT_CAPACITY = 15

  attr_reader :capacity

  def initialize
    @plane = []
    @capacity = DEFAULT_CAPACITY
  end

  def release_plane
    @plane if not empty?
    @plane.pop
  end

  def land plane
    fail "Airport is full" if full?
    @plane << plane
  end

  def full?
    @plane.count >= capacity
  end

  def empty?
    @plane.empty?
  end

  # def weather
  #   number = rand(10)
  #     if number.odd?
  #       puts "it is sunny"
  #     else
  #       fail "Airport is closed"
  #     end
  # end

end
