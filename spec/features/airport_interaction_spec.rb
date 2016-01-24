require 'airport'
require 'plane'
require 'weather'

describe 'Airport Challenge feature tests' do
  let(:plane1) {Plane.new}
  let(:plane2) {Plane.new}
  let(:plane3) {Plane.new}
  let(:airport) {Airport.new 2}
  let(:new_airport) {Airport.new}
  before do
    allow(airport).to receive(:sunny?).and_return true
    # have to stub .sunny? to prevent randomizer from failing test
    plane1.land airport
    plane2.land airport
  end

  it 'planes are able to land' do
    expect(airport.landing_strip).to eq [plane1, plane2]
  end

  it 'planes are able to takeoff and are removed from the airport' do
    plane1.takeoff
    expect(airport.landing_strip).to eq [plane2]
  end

  it 'raises error when plane attempts to land in full airport' do
    expect{plane3.land airport}.to raise_error
  end

  it 'planes not in an airport are not able to takeoff' do
    expect{plane3.takeoff}.to raise_error
  end

  it 'planes in an airport are not able to land' do
    allow(new_airport).to receive(:sunny?).and_return true
    expect{plane2.land(new_airport)}.to raise_error
  end

end
