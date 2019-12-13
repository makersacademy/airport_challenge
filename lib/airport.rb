require './lib/plane.rb'

class Airport
attr_reader :airport, :plane

  def initialize
    @location = []
  end

  def airport?
    true
  end

  def land_plane(plane)
    @location.push(plane).join"You are in the air"
  end


  def take_off_plane(plane)
    @plane = nil
    puts "no longer in the airport!"
  end

  def plane
    @plane
  end
end


  # def runway(land_plane, take_off)
  #   if '#{land_plane}' == "runway_free"
  #   elsif '#{take_off}' == "plane in taxi"
  #   end
  # end
