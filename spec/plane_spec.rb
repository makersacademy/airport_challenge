require 'plane'

describe Plane do
subject(:plane) {described_class.new}

  it 'raise an error when the plane has already landed' do
   airport = Airport.new(10)
   plane.land(airport)
   expect {plane.land(airport)}.to raise_error("The plane has already landed")
  end

  it 'raise an error if landing more planes than the capacity' do
    airport = Airport.new(10)
    expect {11.times{Plane.new.land(airport)}}.to raise_error("The airport is full")
  end

  it 'raise an error if taking off a flying plane' do
    airport = Airport.new(10)
    expect {11.times{plane.take_off(airport)}}.to raise_error("The plane is not in this airport")
  end

  it 'lands' do
    airport = Airport.new(2)
    plane.land(airport)
    expect(airport.planes).to eq [plane]
  end

  it 'takes off' do
    airport = Airport.new(2)
    plane.land(airport)
    plane.take_off(airport)
    expect(airport.planes).to eq []
  end
end
