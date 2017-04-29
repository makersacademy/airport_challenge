require 'plane'
require 'airport'
require 'weather'

describe Plane do
  # lets us simply use 'plane' for a new instantiation of Plane in the examples below
  let(:plane) { Plane.new }
  let(:airport) { Airport.new }
  # simple test to check that our planes really are from our Plane class
  it 'Creates planes' do
    expect(subject.class).to eq Plane
  end

  it 'Creates all planes with an initial status of airborne' do
    expect(plane.status).to eq "airborne"
  end

  it 'Changes status from \'airborne\' to \'landed\' after landing' do
    allow_any_instance_of(Airport).to receive(:weather_today).and_return("sunny")
    expect(plane.status).to eq "airborne"
    airport.land(plane)
    expect(airport.slots[0].status).to eq "landed"
  end

  it 'Changes status from \'landed\' to \'airborne\' after taking off' do
    allow_any_instance_of(Airport).to receive(:weather_today).and_return("sunny")
    airport.land(plane)
    expect(airport.takeoff(0).status).to eq "airborne"
  end
end
