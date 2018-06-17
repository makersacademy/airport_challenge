require_relative '../lib/airport.rb'


describe Airport do
  airport = Airport.new
  it { is_expected.to respond_to(:takeoff_plane) }

  plane = Plane.new
  it { expect(plane.takeoff?).to eq(true) }

  #it 'takeoff plane' do
    #plane = airport.takeoff_plane
    #expect(plane).to be_takeoff
  #end
  describe '#takeoff' do
    it 'takeoff a plane' do
      plane = Plane.new
      subject.land_plane(plane)
      expect(subject.takeoff_plane).to eq plane
    end

    it 'does not allow plane to takeoff' do
      plane = Plane.new
      weather = Weather.new
      allow(weather).to receive(:stormy?).and_return(true)
      message = "Can't takeoff as stormy weather"
      expect { subject.takeoff_plane }.to raise_error message
    end

    it 'allow plane to takeoff' do
      plane = Plane.new
      weather = Weather.new
      allow(weather).to receive(:stormy?).and_return(false)
      message = "Can takeoff"
      expect { subject.takeoff_plane }.not_to raise_error message
    end
  end

  it { is_expected.to respond_to(:land_plane).with(1).argument }

  it { is_expected.to respond_to(:plane) }

  describe '#land' do
    it 'land a plane' do
      plane = Plane.new
      #retrun the plane we land
      expect(subject.land_plane(plane)).to include plane #eq plane
    end

    it 'raise an error when full' do
      #subject.land_plane(Plane.new)
      plane = Plane.new
      subject.capacity.times { subject.land_plane(plane) }
      expect { subject.land_plane(plane,weather) }.to raise_error "Can't land as airport full!"
    end

    it 'does not allow plane to land' do
      plane = Plane.new
      weather = Weather.new
      allow(weather).to receive(:stormy?).and_return(true)
      message = "Can't land as stormy weather"
      expect { subject.land_plane(plane) }.to raise_error message
    end

    it 'allow plane to land' do
      plane = Plane.new
      weather = Weather.new
      allow(weather).to receive(:stormy?).and_return(false)
      message = "Can land"
      expect { subject.land_plane(plane) }.not_to raise_error message
    end

  end
=begin
  describe '#plane' do
    it 'returns landed planes' do
      plane = Plane.new
      subject.land_plane(plane)
      #return the plane we just landed
      expect(subject.plane).to eq plane
    end
  end
=end
  it 'has a default value' do
    expect(subject.capacity).to eq Airport::DEFAULT_CAPACITY
  end

  describe '#initialiez' do
    subject { Airport.new }
    let(:plane) { Plane.new }
    it 'default capacity' do
      described_class::DEFAULT_CAPACITY.times { subject.land_plane(plane) }
      expect { subject.land_plane(plane) }.to raise_error "Can't land as airport full!"
  end
end



end
