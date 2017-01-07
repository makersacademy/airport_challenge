require './lib/airport.rb'
require './lib/plane.rb'
plane = Plane.new

describe Airport do

  it 'recieves plane' do
    plane = Plane.new
    expect(subject.recieve_plane(plane)).to eq plane
  end

  it 'takesoff a plane' do
    plane = Plane.new
    expect(subject.takeoff_plane(plane)).to eq []
  end


end
