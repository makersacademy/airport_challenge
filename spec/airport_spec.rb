require 'airport'

describe Airport do
  let(:plane) {double(:plane)}
  subject(:airport) {described_class.new}

  context 'when checking a plane status' do

    it 'checks that a plane is in the airport after landing' do
      plane = Plane.new
      plane.land(airport)
      expect(airport.check_plane_status(plane)).to eq "Plane in airport"
    end

    it 'checks that a plane has left the airport after takeoff' do
      plane = Plane.new
      plane.takeoff(airport)
      expect(airport.check_plane_status(plane)).to eq "Plane not in airport"
    end

    it 'removes plane from flying status once landed' do
      
    end

  end

context 'keeps plane from landing or taking off when unsafe' do

  it 'raises an error if a plane tries to land when the airport is full' do
    allow(airport).to receive(:stormy?) {false}
    Airport::DEFAULT_CAPACITY.times {Plane.new.land(airport)}
    expect{airport.cleared_for_landing(plane)}.to raise_error("The airport is full.")
  end

  it 'raises an error if a plane tries to land or take off when the weather is stormy' do
    allow(airport).to receive(:stormy?) {true}
    expect{airport.cleared_for_landing(plane)}.to raise_error("It's too stormy to land.")
    expect{airport.cleared_for_takeoff(plane)}.to raise_error("It's too stormy to take off.")
  end

end

end
