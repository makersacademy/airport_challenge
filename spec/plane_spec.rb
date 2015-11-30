require 'plane'
require 'airport'
describe Plane do

let(:plane) {described_class.new}
let(:airport) {double :airport}

  it 'plane has flying status on creation' do
      expect(plane.flying?).to eq true
  end

  it 'be at an airport' do
    expect(plane).to respond_to(:land).with(1).argument
  end

  it 'be at a specific airport and not flying' do
    plane.land(airport)
    expect(plane.at_airport).to eq airport
    expect(plane.flying?).to eq false
  end

  it 'checks plane status is landed after land' do
    plane.land(airport)
    expect(plane.flying?).to eq false
  end

  it 'check plane is flying after take off' do
    plane.land(airport)
    plane.take_off
    expect(plane.flying?).to eq true
  end

end
