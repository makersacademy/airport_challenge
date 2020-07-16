require './lib/plane.rb'

class Airport
attr_reader :airport, :plane

  def initialize
    @plane = 20
    @location = ["You are now grounded","Your plane is in the air"]
    @airport_safety = []
  end

  def airport?
    true
  end

  def land_plane(plane)
    fail "Airport is full" if @airport_safety.count >= 200
    @airport_safety.push(plane)
    puts @location[0]
  end


  def take_off_plane(plane)
    puts @location[1]
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
