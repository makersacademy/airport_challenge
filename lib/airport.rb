require 'dispatcher'

class Airport

  def initialize
    @dispatcher = Dispatcher.new
  end

  def receive(vehicle)
    @dispatcher.travel_allowed? ? nil : (raise 'Travel not allowed at this time')
  end

  def release(vehicle)
    @dispatcher.travel_allowed?
  end
end
