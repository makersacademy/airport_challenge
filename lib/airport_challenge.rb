require_relative 'plane'

class Airport

  attr_accessor :airport_capacity
  attr_reader :planes

  def initialize
    @planes = []
    @airport_capacity = 20
  end

  # weather = (rand(20) == 10) ? 'stormy' : 'sunny'
  # def weather
  #   if rand(20) == 10
  #     'stormy'
  #   else
  #     'sunny'
  #   end
  # end

  def land(plane)
    if @planes.length < 20
      @planes << plane
      @planes
    else
      "Sorry, airport's full!"
    end
  end

  def takeoff(plane)
    if @planes.include?(plane)
      @planes.delete(plane)
    else
      "Plane not at airport"
    end
    @planes
  end

end
