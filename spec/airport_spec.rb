require 'plane_class.rb'
require 'airport_class.rb'
require 'weather_class.rb'

describe Airport do
   subject(:airport){Airport.new}
   test_plane = Plane.new

  it 'plane lands at airport and confirms landing' do
    allow(airport).to receive(:weather?) { 'calm' }
    airport.land_plane
    expect(airport.airport_has_plane?).to be_truthy
  end

  it 'plane takes off from airport and confirms this' do
    allow(airport).to receive(:weather?) { 'calm' }
    airport.land_plane
    airport.release_plane
    expect(airport.airport_has_plane?).to be_falsey
  end

  it 'prevents takeoff during stormy weather' do
    airport.land_plane
    allow(airport).to receive(:weather?) { 'stormy' }
    expect(airport.release_plane).to eq "Takeoff delayed due to bad weather"
  end

  it 'prevents landing during stormy weather' do
    allow(airport).to receive(:weather?) { 'stormy' }
    expect(airport.land_plane).to eq "Landing delayed due to bad weather"
  end

  it 'prevents landing when airport is full' do
    allow(airport).to receive(:weather?) { 'calm' }
    20.times do airport.planes << Plane.new end
    expect(airport.land_plane).to eq "Landing delayed due to airport capacity reached"
  end

  it 'sets default capacity for the airport to 20' do
    expect(airport.capacity).to eq 20
  end

  it 'allows selection of custom capacity for the airport' do
    test_airport = Airport.new(15)
    expect(test_airport.capacity).to eq 15
  end

end
