require './lib/dest_airport.rb'
require './lib/plane.rb'
plane = Plane.new

describe DestAirport do

  it 'recieves plane' do
    plane = Plane.new
    expect(subject.recieve_plane(plane)).to eq plane
  end



end
