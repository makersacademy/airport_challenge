require 'dispatcher'

class Airport

  def initialize
    @dispatcher = Dispatcher.new
    @vehicles_parked = []
  end

  def receive(vehicle)
    @dispatcher.travel_allowed? ? (@vehicles_parked << vehicle) : (raise 'Travel not allowed at this time')
  end

  def release(vehicle)
    @dispatcher.travel_allowed? ? (@vehicles_parked.delete(vehicle)) : (raise 'Travel not allowed at this time')
  end

  def parked?(vehicle)
    @vehicles_parked.include?(vehicle)
  end
end
