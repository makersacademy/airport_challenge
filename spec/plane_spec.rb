require './lib/plane.rb'
require './lib/dest_airport.rb'

dest_airport = DestAirport.new

describe Plane do

  it 'plane responds to land' do
    expect(subject).to respond_to :land
  end

  it 'plane lands' do
    plane = Plane.new
    expect(plane.land).to eq ['landed']

  end





end
