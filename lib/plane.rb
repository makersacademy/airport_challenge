require 'airport'

# Understand how to keep track of the plane's location

class Plane

  attr_reader :name, :location

  def initialize(name = "P#" + "#{self}"[-5..-2])
    @location = :up_in_the_air
    @name = name.to_sym
  end

  def landing(airport)
    @location = airport
  end

  def taking_off
    @location = :up_in_the_air
  end

end
