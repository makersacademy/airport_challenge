require 'airport'
require 'weather'

describe Airport do

  before :each do
    @airport = Airport.new
    @plane = Plane.new
    @weather = Weather.new
    allow(Weather).to receive(:stormy?) { false }
  end

  describe '#landing' do
    it 'allows planes to land' do
      expect(subject.land(@plane)).to eq [@plane]
    end
    it 'stops plane from landing if weather is bad' do
      allow(Weather).to receive(:stormy?) { true }
      expect { @airport.land(@plane) }.to raise_error "Unable to land"
    end
    it 'raises an error when you try and land a grounded plane' do
      @airport.land(@plane)
      expect { @airport.land(@plane) }.to raise_error "This plane has already landed!"
    end
    it 'stops plane landing if airport full' do
      airport = Airport.new(2)
      plane1 = double("plane1", :flying? => true, :update_status => "Landed")
      plane2 = double("plane2", :flying? => true, :update_status => "Landed")
      allow(Weather).to receive(:stormy?) { false }
      airport.land(plane1)
      airport.land(plane2)
      plane = Plane.new
      allow(plane).to receive(:flying?).and_return(true)
      expect { airport.land(plane) }.to raise_error "Unable to land"
    end
  end

  describe '#takeoff' do
    it 'allows the plane to take off' do
      @airport.land(@plane)
      expect(@airport.takeoff_plane(@plane)).to eq @plane
    end

    it 'stops plane from taking off if airport is empty' do
      expect { @airport.takeoff_plane(@plane) }.to raise_error "Unable to take off"
    end

    it 'stops plane from taking off if the weather is bad' do
      @airport.land(@plane)
      allow(Weather).to receive(:stormy?) { true }
      expect { @airport.takeoff_plane(@plane) }.to raise_error "Unable to take off"
    end
    it 'raises an error when attempting to take off a plane which is not at the airport' do
      plane2 = double(:plane)
      @airport.land(@plane)
      expect { @airport.takeoff_plane(plane2) }.to raise_error "This plane is not at the airport!"
    end
  end

  describe '#initialize' do
    it 'should initialize with given capacity' do
      airport = Airport.new(200)
      expect(airport.capacity).to eq(200)
    end

    it 'should initialize with default capacity given no capacity' do
      expect(subject.capacity).to eq Airport::DEFAULT_CAPACITY
    end
  end

  describe '#weather' do
    it 'gets weather' do
      allow(Weather).to receive(:stormy?) { true }
      expect(@airport.bad_weather?).to eq true
    end
  end
end
