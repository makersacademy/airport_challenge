require 'plane_class.rb'
require 'airport_class.rb'
require 'weather_class.rb'

#Refactor to use more context blocks and describes to avoid repetition

describe Airport do
  subject(:airport) {described_class.new}
  test_plane = Plane.new

  it 'plane lands at airport and confirms landing' do
    allow(airport).to receive(:weather?) { 'calm' }
    airport.land_plane
    expect(airport.planes.empty?).to be_falsey
  end

  it 'plane takes off from airport and confirms this' do
    allow(airport).to receive(:weather?) { 'calm' }
    airport.planes << test_plane
    airport.release_plane
    expect(airport.planes.empty?).to be_truthy
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

  context 'capacity' do
    subject(:airport) { described_class.new(15) }

  it 'allows selection of custom capacity for the airport' do
    expect(airport.capacity).to eq 15
    end
  end

  it 'prevents takeoff if there are no planes' do
    allow(airport).to receive(:weather?) { 'calm' }
    expect(airport.release_plane).to eq 'No planes available'
  end

  it 'allows multiple planes to be released' do
    3.times {airport.planes << Plane.new}
    allow(airport).to receive(:weather?) { 'calm' }
    airport.release_multiple_planes(3)
    expect(airport.planes).to eq []
  end

  it 'allows multiple planes to land' do
    allow(airport).to receive(:weather?) { 'calm' }
    airport.land_multiple_planes(3)
    expect(airport.planes.length).to eq 3
  end
end
