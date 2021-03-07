# require_relative 'airport.rb'

class Plane
  def initialize
    @status = { flying: true, location: "The Sky!"}
  end

  attr_reader :status

  def land(airport)
    adjust_status(false, airport)
  end

private

  def adjust_status(flying, location)
    @status = {flying: flying, location: location}
  end

end
