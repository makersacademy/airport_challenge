require 'plane'

describe Plane do

  subject(:plane) {described_class.new}
  let (:airport) {double :airport}

  it 'instruct plane to land' do
    plane.land(airport)
    expect(plane.airport).to eq airport
  end

  it 'instruct plane to take_off' do
    plane.take_off(airport)
    expect(plane.airport).to eq nil
  end




end
