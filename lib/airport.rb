require_relative 'passenger'

class Airport
  attr_accessor :capacity
  attr_reader :seats
  DEFAULT_CAPACITY = 100

  def initialize(capacity=DEFAULT_CAPACITY)
    @seats = []
    @capacity = capacity
  end

  def load(people=[Passenger.new])
    @people = people
    raise "Airport full!" if full?
    @seats.concat(people)
    self
  end

  def unload
    leaving = @seats
    @seats = []
    leaving
  end

  def full?
    @people ||= []
    @people.size + @seats.size > @capacity
  end
end

