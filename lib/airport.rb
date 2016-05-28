require_relative 'passenger'

class Airport

  attr_reader :passengers

  def initialize
    @passengers = []
  end

  def load(people=[Passenger.new])
    @passengers.concat(people)
    self
  end

  def unload
    self
  end
end

