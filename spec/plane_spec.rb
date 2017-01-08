require './lib/plane.rb'
require './lib/airport.rb'
require './lib/weather.rb'


airport = Airport.new

describe Plane do

  it 'plane responds to land' do
    expect(subject).to respond_to :land
  end

  it 'plane lands' do
    plane = Plane.new
    expect(plane.land).to eq ['landed']
  end

  it 'plane takes off' do
    plane = Plane.new
    plane.land
    expect(plane.takeoff).to eq ['flying']
  end

=begin

  it 'cannot land when stormy' do
    plane = Plane.new
    weather = Weather.new('stormy')
    expect{plane.land}.to raise_error('cannot land when stormy')
  end


  it 'plane wont land if airport full' do
    plane = Plane.new
    plane.land
    airport.recieve_plane(plane)
    plane2 = Plane.new
    expect{plane2.land}.to raise_error("airport full")
  end
=end

end
