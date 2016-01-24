require 'plane'
require 'airport'
require 'weather'

describe Plane do

  subject(:Plane) {described_class.new}
  let(:airport) {double :airport}

  it 'it knows it has landed' do
    # airport = Airport.new(weather)
    #allow(weather).to receive(:stormy?).and_return false
    # plane = Plane.new
    allow(airport).to receive(:land)
    airport.land(subject)
    expect(subject.not_in_air?).to eq false
  end

  it 'it knows it is in the air' do
    # plane = Plane.new
    expect(subject.in_air?).to eq true
  end

  it 'cannot take off if already in the air' do
    allow(subject).to receive(:in_air)
    expect{subject.plane_take_off(airport)}.to raise_error "The plane is already in the air"
  end

  it 'cannot land if it is already in the airport' do
    # allow(subject).to receive(:plane_landed)
    # allow(airport).to receive(:land)
    # airport.land(subject)
    # subject.not_in_air?
    subject.plane_landed(airport)
    expect{subject.plane_landed(airport)}.to raise_error "The plane has already landed"
  end

  it 'cannot be in an airport if in the air' do
    subject.in_air?
    expect{ subject.at_airport }.to raise_error "The plane is in the air"
  end

  it 'must be in an airport if landed' do
    expect(subject.plane_landed(airport)).to eq airport
  end

  it 'cannot take off from another airport' do
    subject.plane_landed(airport)
    expect(subject.plane_take_off(airport)).to eq airport
  end
end
