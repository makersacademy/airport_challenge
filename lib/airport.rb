#responsible for storing vehicles (planes for now)
#its default capacity can be modified. it also responds to full?

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
    if @receive_dispatcher.travel_allowed?(self)
       @vehicles_parked << vehicle
    else
      fail 'Travel not allowed at this time'
    end
  end

  def release(vehicle)
    if @release_dispatcher.travel_allowed?
       @vehicles_parked.delete(vehicle)
    else
      fail 'Travel not allowed at this time'
    end
  end

  def parked?(vehicle)
    @vehicles_parked.include?(vehicle)
  end

  def full?
    @vehicles_parked.count == @capacity 
  end
end
