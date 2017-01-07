require './lib/plane.rb'
require './lib/airport.rb'

dest_airport = Airport.new

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
  it 'cannot takeoff when stormy' do
    plane = Plane.new
    plane.land
    expect(plane)
  end


  it 'plane wont land if airport full' do
    plane = Plane.new
    plane.land
    plane2 = Plane.new
    expect{plane2.land}.to raise_error("airport full")
  end
=end

end
