require 'plane'

describe Plane do

subject(:plane) {described_class.new}
let(:airport) {double(:airport)}

  it 'allows confirmation that the plane has landed' do
    plane.land(airport)
    expect(plane.status).to eq :on_the_ground
  end

  it 'allows confirmation that the plane has taken off' do
    plane.land(airport)
    plane.take_off(airport)
    expect(plane.status).to eq :in_the_air
  end

  it 'knows which airport it has landed at' do
    plane.land(airport)
    expect(plane.airport_at).to eq airport
  end

  it 'can take off from an airport it is in' do
    plane.land(airport)
    plane.take_off(airport)
    expect(plane.status).to eq :in_the_air
   end

  it 'can\'t take off from an airport it\'s not in' do
    airport2 = double(:airport)
    plane.land(airport2)
    message = "Can't take off from an airport the plane isn't at."
    expect{plane.take_off(airport)}.to raise_error message
  end

  it 'cannot take off if already flying' do
    allow(plane).to receive(:airport_at).and_return(airport)
    allow(plane).to receive(:status).and_return(:in_the_air)
    message = "Can't take off, already in the air."
    expect{plane.take_off(airport)}.to raise_error message
  end

end
