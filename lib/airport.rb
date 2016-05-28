require_relative 'passenger'

class Airport
  attr_accessor :capacity
  attr_reader :passengers
  DEFAULT_CAPACITY = 100

  def initialize(capacity=DEFAULT_CAPACITY)
    @passengers = []
    @capacity = capacity
  end

  def load(people=[Passenger.new])
    @people = people
    raise "Airport full!" if full?
    @passengers.concat(people)
    self
  end

  def unload
    leaving = @passengers
    @passengers = []
    leaving
  end

  def full?
    @people ||= []
    @people.size + @passengers.size > @capacity
  end
end

