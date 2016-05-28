require_relative 'airport'
require_relative 'passenger'

class Plane
  attr_accessor :capacity
  attr_reader :seats
  DEFAULT_CAPACITY = 100

  def initialize(capacity=DEFAULT_CAPACITY)
    @seats = []
    @capacity = capacity
  end

  def load(people=[Passenger.new])
    @people = people
    fail "Capacity reached!" if full?
    @seats.concat(people)
    self
  end

  def unload
    fail "Plane airbourne! You must be nuts!" if flying?
    leaving = @seats
    @seats = []
    leaving
  end

  def take_off
    fail "Plane already airbourne!" if flying?
    @flying = true
  end

  def land
    fail "Plane can't land! Already grounded!" unless flying?
    @flying = false
    true
  end

  private

  def flying?
    @flying ||= false
  end

  def full?
    @people ||= []
    @people.size + @seats.size > @capacity
  end
end