require 'airport'

describe Airport do

subject(:airport) { described_class.new }
subject(:other_airport) { described_class.new }
let(:plane) { double :plane }

before(:each) do
  allow(airport).to receive(:weather_stormy?).and_return false
  allow(other_airport).to receive(:weather_stormy?).and_return false
end

  describe '#land' do

    before(:each) do
      allow(plane).to receive(:on_the_ground).and_return(false)
      allow(plane).to receive(:landed).and_return(true)
    end

    it 'lands a plane at the airport in good weather' do
      expect(airport.land(plane)).to eq [plane]
    end

    it 'prevents landing when the airport is full' do
      Airport::DEFAULT_CAPACITY.times { airport.land(plane) }
      msg = "Cannot land plane because airport at full capacity"
      expect{airport.land(plane)}.to raise_error msg
    end

    it 'raises error if landing attempted in stormy weather' do
      allow(airport).to receive(:weather_stormy?).and_return true
      msg = "Cannot land plane because of stormy weather"
      expect{airport.land(plane)}.to raise_error msg
    end

    it 'should not allow a grounded plane to land again' do
      allow(plane).to receive(:on_the_ground).and_return true
      #allow(plane).to receive(:taken_off)
      msg =  "This plane is already at an airport"
      expect{airport.land(plane)}.to raise_error msg
    end
  end

  describe '#take_off' do
    before(:each) do
      allow(plane).to receive(:on_the_ground).and_return(false)
      allow(plane).to receive(:landed).and_return(true)
    end

    it 'allows a plane to take off from the airport in good weather' do
      airport.land(plane)
      allow(plane).to receive(:on_the_ground).and_return true
      allow(plane).to receive(:taken_off).and_return false
      airport.take_off(plane)
      expect(airport.instance_variable_get(:@planes)).to eq []
    end

    it 'raises error if takeoff attempted in stormy weather' do
      allow(airport).to receive(:weather_stormy?).and_return true
      msg = "Cannot let plane take off because of stormy weather"
      expect{airport.take_off(plane)}.to raise_error
    end

    it 'should not allow a flying plane to take off again' do
      allow(plane).to receive(:on_the_ground).and_return(false)
      allow(plane).to receive(:landed).and_return(false)
      msg =  "This plane is already in the air"
      expect{airport.take_off(plane)}.to raise_error msg
    end

    it 'should not allow a plane to take off unless it is at that airport' do
      airport.land(plane)
      allow(plane).to receive(:on_the_ground).and_return true
      allow(plane).to receive(:taken_off)
      msg = "This plane is not at this airport"
      expect{other_airport.take_off(plane)}.to raise_error msg
    end
  end

  describe '#planes' do
    before(:each) do
      allow(plane).to receive(:on_the_ground).and_return(false)
      allow(plane).to receive(:landed)
      airport.land(plane)
    end

    it 'has registered landed plane at airport' do
      expect(airport.instance_variable_get(:@planes)).to eq [plane]
    end

    it 'confirms that plane is no longer at airport after takeoff' do
      allow(plane).to receive(:on_the_ground).and_return true
      allow(plane).to receive(:taken_off)
      airport.take_off(plane)
      expect(airport.instance_variable_get(:@planes)).not_to include plane
    end
  end

end
