require 'airport'
require 'weather'
require 'plane'

describe  Airport do
let(:airport) {Airport.new}
let(:plane)   {Plane.new}
# let(:weather) {Weather.new}

  it 'has an empty hangar to store planes' do
    expect(airport.hangar).to be_empty
  end

  it 'can land a plane' do
    plane = Plane.new
    expect(airport).to respond_to(:landing_control)
  end

  it 'lets a plane take-off' do
    airport.hangar << plane
    airport.take_off(plane)
    expect(airport.hangar).to be_empty
  end

  it 'prints a message saying the plane is no longer in the airport' do
    airport.hangar << plane
    expect(airport.take_off(plane)).to eq 'The plane has taken off'
  end

  it 'does not allow a plane to take-off in stormy weather' do
    allow(airport.call_weather).to receive(:check_weather) { 1 }
    airport.hangar << plane
    expect(airport.take_off(plane)).to eq 'There is a storm - cannot take-off!'
  end

end
