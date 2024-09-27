require 'airport'

describe AirportClass do

  describe '#release_plane' do
    it 'releases a plane' do
      plane = Plane.new
      subject.land(plane)
      # we want to release the plane we landed
      expect(subject.release_plane).to eq plane
    end
     it 'raises an error when there are no planes available' do
      # Let's not dock a bike first:
      # remember subject == DockingStation.new
      expect { subject.release_plane }.to raise_error 'No planes available'
    end
  end

  describe '#airport' do
  it 'raises an error when storm' do
    subject.land(Plane.new)
    expect { subject.land Plane.new }.to raise_error 'Airport full'
  end
end

  it { is_expected.to respond_to :release_plane }
  
  it 'gets plane' do
    # cannot use .release_bike in this currently
    # bike = subject.release_bike
    # expect(Bike.new).to be_working
    expect(Plane.new).to respond_to(:working?)
  end

  it { is_expected.to respond_to(:airport).with(1).argument }
  it { is_expected.to respond_to :planes }

  it 'should land planes' do 
    plane = Plane.new
    expect(subject.land(plane)).to eq plane
  end

  it 'should return landed plane' do 
    plane = Plane.new
    subject.land(planes)
    expect(subject.planes).to eq planes
  end
end