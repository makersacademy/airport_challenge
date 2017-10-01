require 'airport'
require 'plane'

describe Airport do
  subject(:airport) {Airport.new(21, 20)}
  plane = Plane.new

  it 'sets default capacity and plane count' do
    expect(airport.capacity).to eq 21
    expect(airport.plane_count).to eq 20
  end

  it { is_expected.to respond_to(:plane_takeoff) }

  it { is_expected.to respond_to(:land_plane).with(1).argument }

  it { is_expected.to respond_to(:confirm_takeoff) }

  it 'confirms when plane has taken off' do
    plane = airport.plane_takeoff
    expect(airport.confirm_takeoff).to eq "#{plane.to_s} has now taken off"
  end

  it "raises error as plane tries to land when capacity is full" do
    expect{ airport.land_plane(plane) }.to raise_error 'Airport capacity is full. No plane could land.'
  end

  it { is_expected.to respond_to(:weather_generator) }

  it "raises error as plane tries to take off when weather is stormy" do
    allow(airport).to receive(:weather_generator).and_return(8)
    expect{ airport.plane_takeoff }.to raise_error 'Weather is stormy. No plane takeoff.'
  end





end
