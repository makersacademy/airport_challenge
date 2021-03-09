require 'airport'

describe Airport do

  let(:sunny_weather) { double :weather, create: 0 }
  let(:stormy_weather) { double :weather, create: 2 }
  let(:capacity) { 2 }
  let(:plane_double1) { double :plane, in_air?: true }
  let(:plane_double2) { double :plane, in_air?: true }
  let(:plane_double3) { double :plane, in_air?: true }
  let(:plane_double4) { double :plane, in_air?: false }
  let(:plane_double5) { double :plane, in_air?: false }

  it "has a default capacity" do
    expect(subject.capacity).to eq Airport::DEFAULT_CAPACITY
  end

  it { is_expected.to respond_to(:land).with(1).arguments }

  it { is_expected.to respond_to(:take_off).with(1).arguments }

  describe '#land_plane' do
    it 'lands plane when good weather' do
      airport = Airport.new(capacity, sunny_weather, [])
      allow(plane_double1).to receive(:ground)
      airport.land(plane_double1)
      expect(airport.planes).to include(plane_double1)
    end

    it 'raises an error when airport is full' do
      airport = Airport.new(capacity, sunny_weather, [])
      allow(plane_double1).to receive(:ground)
      allow(plane_double2).to receive(:ground)
      allow(plane_double3).to receive(:ground)
      airport.land(plane_double1)
      airport.land(plane_double2)
      expect { airport.land(plane_double3) }.to raise_error "airport is full"
    end

    it 'raises an error when trying to land a grounded plane' do
      airport = Airport.new(capacity, sunny_weather, [])
      allow(plane_double4).to receive(:ground)
      expect { airport.land(plane_double4) }.to raise_error "plane already grounded"
    end

    it 'raises an error when trying to land a plane located in the hangar' do
      airport = Airport.new(capacity, sunny_weather, [])
      allow(plane_double1).to receive(:ground)
      airport.land(plane_double1)
      expect { airport.land(plane_double1) }.to raise_error "plane already grounded"
    end

    it 'raises an error when trying to land a plane in stormy weather' do
      airport = Airport.new(capacity, stormy_weather, [])
      allow(plane_double1).to receive(:ground)
      expect { airport.land(plane_double1) }.to raise_error 'cannot land: stormy weather'
    end
  end

  describe '#take_off' do
    it 'allows a plane to leave the airport to take off' do
      airport = Airport.new(capacity, sunny_weather, [plane_double4])
      allow(plane_double4).to receive(:airborn)
      airport.take_off(plane_double4)
      expect(airport.planes).to eq([])
    end

    it 'allows a specific plane to take-off from the airport, leaving other planes in hangar' do
      airport = Airport.new(capacity, sunny_weather, [plane_double4, plane_double5])
      allow(plane_double4).to receive(:airborn)
      airport.take_off(plane_double4)
      expect(airport.planes).to eq([plane_double5])
    end

    it 'gives confirmation when a specific plane has taken-off' do
      airport = Airport.new(capacity, sunny_weather, [plane_double4, plane_double5])
      allow(plane_double4).to receive(:airborn)
      expect(airport.take_off(plane_double4)).to eq("#{plane_double4} has successfully taken off")
    end

    it 'raises an error when trying to take-off in stormy weather' do
      airport = Airport.new(capacity, stormy_weather, [plane_double4])
      expect { airport.take_off(plane_double4) }.to raise_error 'cannot take-off: stormy weather'
    end

    it 'raises an error if plane already in the air' do
      airport = Airport.new(capacity, sunny_weather, [])
      expect { airport.take_off(plane_double1) }.to raise_error 'cannot take-off: plane not at airport'
    end

    it 'raises an error if plane not in the hangar' do
      airport = Airport.new(capacity, sunny_weather, [plane_double4])
      expect { airport.take_off(plane_double1) }.to raise_error 'cannot take-off: plane not at airport'
    end
  end


end
