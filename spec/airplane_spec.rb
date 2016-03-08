require 'airplane'

describe Airplane do
let(:plane) {Airplane.new}
let(:airport) {double :airport, :planes => [], :allow_landing => true, :allow_takeoff => true}

  describe 'plane_status' do
    it 'should not be landed when a new plane is initialized' do
      expect(subject.landed).to eq false
    end

    it 'should confirm that the plane has taken off with the plane status' do
      airport.allow_landing(plane)
      airport.allow_takeoff(plane)
      expect(plane.plane_status).to eq true
    end

    it 'should confirm the plane has landed with the plane status' do
      allow(plane).to receive(:landed).and_return(true)
      expect(plane.landed).to eq true
    end
  end

describe '#land_plane!' do
  it 'should not allow landing if already landed' do
    plane.land_plane!
    message = 'Plane already landed'
    expect{ plane.land_plane! }.to raise_error message
  end
end

describe '#take_off!' do
  it 'should not take off from airport if already taken off' do
    airport.allow_landing(plane)
    airport.allow_takeoff(plane)
    message = 'Plane already taken off'
    expect { plane.take_off! }.to raise_error message
  end
end

end
