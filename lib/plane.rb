require_relative 'airport'
require_relative 'errors'
require_relative 'conditions'

class Plane
  attr_accessor :flying, :airport

  def initialize(errors = Errors.new(self), conditions = Conditions.new(self))
    @id = object_id
    @flying = true
    @errors = errors
    @conditions = conditions
  end

  def land(airport)
    @errors.land(airport)
    @conditions.land(airport)
    airport.land(self)
  end

  def take_off(airport)
    @errors.take_off(airport)
    airport.take_off(self)
    @conditions.take_off(airport)
  end

end
