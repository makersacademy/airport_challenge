require_relative './weather.rb'

class Plane

  include Weather

  attr_reader :location
  attr_accessor :flying

  def initialize
    @location=nil
    @flying=true
  end

  def land airport
    if @flying==true
      raise 'Cannot land while airport is full' if airport.full
      raise 'Cannot land while weather is stormy.' if airport.weather==:stormy
      complete_landing(airport)
    else 
      'This plane is already on the ground.'
    end 
  end

  def complete_landing airport
    @location=airport.name
    @flying=false
    airport.planes << self
    "The plane has landed at #{airport.name}"
  end

  def take_off airport
    if @flying==false
      if airport.planes.include?(self)
        raise 'Cannot take off while weather is stormy.' if airport.weather==:stormy
        complete_take_off(airport)
      else
        'The plane is not at this airport.'
      end
    else  
    'The plane is already flying'
    end  
  end

  def complete_take_off airport
    @location=nil
    @flying=true
    airport.planes.delete(self)
    "The plane has taken off from #{airport.name}"
  end

end