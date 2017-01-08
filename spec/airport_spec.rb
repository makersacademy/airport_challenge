require './lib/airport.rb'
require './lib/plane.rb'
require './lib/weather.rb'

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

  it 'airport wont accept plane if full' do
    plane = Plane.new
    plane.land
    subject.recieve_plane(plane)
    plane2 = Plane.new
    expect{subject.recieve_plane(plane2)}.to raise_error("airport full")
  end

end
