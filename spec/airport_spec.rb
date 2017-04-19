require 'airport'

describe Airport do

subject(:airport) { described_class.new }
subject(:airport_1) { described_class.new }
let(:plane) { double :plane }

before(:each) do
  allow(airport).to receive(:bad_weather?).and_return false
  allow(airport_1).to receive(:bad_weather?).and_return false
end

  describe '#land' do

    before(:each) do
      allow(plane).to receive(:grounded).and_return(false)
      allow(plane).to receive(:landed)
    end

    it 'lands a plane at the airport in good weather' do
      expect(airport.land(plane)).to eq [plane]
    end

    it 'prevents landing when the airport is full' do
      Airport::DEFAULT_CAPACITY.times { airport.land(plane) }
      msg = "Planes cannot land when airport is full"
      expect{airport.land(plane)}.to raise_error msg
    end

    it 'raises error if landing attempted in stormy weather' do
      allow(airport).to receive(:bad_weather?).and_return true
      msg = "Planes cannot land in stormy weather"
      expect{airport.land(plane)}.to raise_error msg
    end

    it 'should not allow a grounded plane to land again' do
      allow(plane).to receive(:grounded).and_return true
      allow(plane).to receive(:taken_off)
      msg =  "This plane is already at an airport"
      expect{airport.land(plane)}.to raise_error msg
    end
  end

  describe '#take_off' do
    before(:each) do
      allow(plane).to receive(:grounded).and_return(false)
      allow(plane).to receive(:landed).and_return(true)
    end

    it 'allows a plane to take off from the airport in good weather' do
      airport.land(plane)
      allow(plane).to receive(:grounded).and_return true
      allow(plane).to receive(:taken_off).and_return false
      airport.take_off(plane)
      expect(airport.instance_variable_get(:@planes)).to eq []
    end

    it 'raises error if takeoff attempted in stormy weather' do
      allow(airport).to receive(:bad_weather?).and_return true
      msg = "Planes cannot take off in stormy weather"
      expect{airport.take_off(plane)}.to raise_error
    end

    it 'should not allow a flying plane to take off again' do
      allow(plane).to receive(:grounded).and_return(false)
      allow(plane).to receive(:landed).and_return(false)
      msg =  "This plane is already flying"
      expect{airport.take_off(plane)}.to raise_error msg
    end

    it 'should not allow a plane to take off unless it is at that airport' do
      airport.land(plane)
      allow(plane).to receive(:grounded).and_return true
      allow(plane).to receive(:taken_off)
      msg = "This plane is not at this airport"
      expect{airport_1.take_off(plane)}.to raise_error msg
    end
  end

  describe '#planes' do
    before(:each) do
      allow(plane).to receive(:grounded).and_return(false)
      allow(plane).to receive(:landed)
      airport.land(plane)
    end

    it 'has registered landed plane at airport' do
      expect(airport.instance_variable_get(:@planes)).to eq [plane]
    end

    it 'confirms that plane is no longer at airport after takeoff' do
      allow(plane).to receive(:grounded).and_return true
      allow(plane).to receive(:taken_off)
      airport.take_off(plane)
      expect(airport.instance_variable_get(:@planes)).not_to include plane
    end
  end

end
