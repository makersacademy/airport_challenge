require 'airport'
require 'plane'
require 'weather'

def manage_transition(from, to, airport, type)
  plane = from.last
  current_weather = weather
  transitioned_plane = airport.__send__(type, plane, current_weather)
  return if transitioned_plane.nil?
  to << transitioned_plane
  from.delete(plane)
end

describe "let's create some air traffic, so I can visit Makers in person" do

  it 'allows us to let planes land/take off' do  
    cologne_bonn = Airport.new(30)
    london_heathrow = Airport.new(30)
    flying_planes = Array.new(100) { Plane.new }
    cologne_planes = []
    london_planes = []
    srand(1234)
    25.times do 
      manage_transition(flying_planes, cologne_planes, cologne_bonn, :instruct_to_land)
      manage_transition(flying_planes, london_planes, london_heathrow, :instruct_to_land)
    end
    100.times do
      manage_transition(cologne_planes, flying_planes, cologne_bonn, :instruct_to_take_off)
      manage_transition(london_planes, flying_planes, london_heathrow, :instruct_to_take_off)
      manage_transition(flying_planes, cologne_planes, cologne_bonn, :instruct_to_land)
      manage_transition(flying_planes, london_planes, london_heathrow, :instruct_to_land)
    end
    distribution = [flying_planes.count, cologne_planes.count, london_planes.count]
    expect(distribution).to eq([63, 15, 22])
  end
end
