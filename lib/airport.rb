require_relative 'aircraft'

class Airport
  attr_reader :capacity, :aircrafts
  DEFAULT_CAPACITY = 5

  def initialize capacity=DEFAULT_CAPACITY
    @capacity = capacity
    @aircrafts = []
  end

  def landing aircraft
    raise 'The aircraft has already landed.' if aircraft.landed == true
    raise 'The airport is full.' if full
    aircraft.change_status
    @aircrafts << aircraft
    'The aircraft has landed safely.'
  end

  private
  def empty
    @aircrafts == []
  end

  def full
    @aircrafts.count >= @capacity
  end
end
