require_relative 'plane'

class Airport

attr_reader :planes

def initialize
  @planes = []
end

def land_plane(plane)
raise "CANNOT LAND IN A STORM" if stormy?
    @planes << plane
end

def plane_take_off(plane)
raise "CANNOT TAKE-OFF IN A STORM"if stormy?
    @planes.reject! {|plane| plane == plane}
end

private

def stormy?
  number = rand(0..10)
  number == 5 ? true : false
end


end
