require 'plane'
require 'airport'
require 'weather'


describe 'Air Traffic Control' do
  heathrow = Airport.new('Heathrow', 30)
  boeing747 = Plane.new
  weather = Weather.new

  #User Story 1
  it 'can land a plane' do
    heathrow.land_plane(boeing747, weather)
    puts "The plane has landed at #{heathrow.name} = #{boeing747.landed?}"
  end

  #User Story 2
  it 'can instruct a plane to take off' do
    heathrow.take_off(boeing747, weather)
    puts "The plane is still at #{heathrow.name} = #{boeing747.landed?}"
  end

  #User Story 2
  it 'can check a plane has left the airport' do
    p boeing747.landed?
  end

end
