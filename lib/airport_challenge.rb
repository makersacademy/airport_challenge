require_relative 'plane'

class Airport

  attr_accessor :airport_capacity
  attr_reader :planes
  # attr_accessor :weather

  def initialize
    @planes = []
    @airport_capacity = 20
    # @weather = 'sunny'
  end

  # def weather
  #   if rand(20) == 10
  #     @weather = 'stormy'
  #   end
  # end

  def land(plane)
    # if weather = 'stormy'
    #   "No landings while weather is stormy"
    if @planes.length < 20
      @planes << plane
    else
      "Sorry, airport's full!"
    end
  end

  def takeoff(plane)
    if @planes.include?(plane)
      @planes.delete(plane)
      "#{plane} has left the airport"
    else
      "Plane not at airport"
    end
  end
end
