require 'planes'

class Airport
  attr_reader :planes 
  # planes in airport

  def initialize
    @planes = []
  end

  def land_plane
    @planes
  end

  def take_off
    fail 'All planes departed' if empty?

    @planes.pop
  end 

  # planes on the airport
  def apron(planes)  
    fail 'Airport is full' if full?

    @planes << planes
  end

  private

  def full?
    @planes.count >= 20
  end

  def empty?
    @planes.empty?
  end
end

  # planes.pop  remove planes from aiport 
  # when airport reached capacity no landing
  # default airport capacity later can be overridden 
  