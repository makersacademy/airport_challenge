require_relative './dispatcher'
require_relative './receive_dispatcher'

class Airport

  DEFAULT_CAPACITY = 100

  def initialize(capacity=DEFAULT_CAPACITY)
    @receive_dispatcher = ReceiveDispatcher.new 
    @release_dispatcher = Dispatcher.new
    @vehicles_parked = []
    @capacity = capacity
  end

  def receive(vehicle)
    @receive_dispatcher.travel_allowed?(self) ? (@vehicles_parked << vehicle) : (raise 'Travel not allowed at this time')
  end

  def release(vehicle)
    @release_dispatcher.travel_allowed? ? (@vehicles_parked.delete(vehicle)) : (raise 'Travel not allowed at this time')
  end

  def parked?(vehicle)
    @vehicles_parked.include?(vehicle)
  end

  def full?
    @vehicles_parked.count == @capacity 
  end
end
