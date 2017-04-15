require_relative './safety'

class Plane
  include Safety
  attr_reader :name, :status

  def initialize(name)
    @name = name
    @status = 'airborne'
  end

  def land(airport)
    airport.planes.push self
    @status = 'grounded'
    "#{@name} has landed in #{airport.name}"
  end

  def take_off(airport)
    airport.planes.delete self
    @status = 'airborne'
    "#{@name} has taken off from #{airport.name}"
  end

end
