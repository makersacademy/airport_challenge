require_relative './airport.rb'

class Plane
  attr_reader :location

  def initialize
    @location = :default_location
  end

  def lands_at(airport)
    @location = airport.identifier
  end
end
