require 'airport'

describe Airport do

subject(:airport) { described_class.new }
subject(:other_airport) { described_class.new }
let(:plane) { double :plane }

before(:each) do
  allow(airport).to receive(:stormy_weather).and_return(false)
  allow(other_airport).to receive(:stormy_weather).and_return(false)
end

  describe '#land' do

      before(:each) do
        allow(plane).to receive(:grounded).and_return(false)
        allow(plane).to receive(:landed)
        end

        it 'lands a plane at the airport in good weather' do
        expect(airport.land(plane)).to eq [plane]
      end

      it 'raises an error if the weather is too stormy for landing' do
        allow(airport).to receive(:stormy_weather).and_return(true)
        message = 'Weather too stormy for landing'
        expect{airport.land(plane)}.to raise_error message
        end

      it 'raises an error if a plane cannot land because the airport is full' do
        Airport::DEFAULT_CAPACITY.times {airport.land(plane)}
        message = 'Airport full, plane cannot land'
        expect{airport.land(plane)}.to raise_error message
        end

      it 'raises an error so that grounded planes cannot land' do
        allow(plane).to receive(:grounded).and_return true
        allow(plane).to receive(:taken_off)
        message = 'Grounded planes cannot land'
        expect{airport.land(plane)}.to raise_error message
      end
    end

  describe '#take_off' do

    before(:each) do
      allow(plane).to receive(:grounded).and_return(false)
      allow(plane).to receive(:landed).and_return(true)
      expect(airport.instance_variable_get(:@planes)).to eq []
    end

    it 'raises an error if the weather is too stormy for take off' do
      allow(plane).to receive(:grounded).and_return true
      allow(plane).to receive(:taken_off).and_return false
      allow(airport).to receive(:stormy_weather).and_return true
      message = 'Weather too stormy for take off'
      expect{airport.take_off(plane)}.to raise_error message
    end

    it 'raises an error so that flying planes cannot take off' do
      allow(plane).to receive(:grounded).and_return false
      allow(plane).to receive(:landed).and_return false
      message = 'Plane out flying'
      expect{airport.take_off(plane)}.to raise_error message
    end

    it 'only allows planes at the given airport to take off' do
      airport.land(plane)
      allow(plane).to receive(:grounded).and_return true
      allow(plane).to receive(:taken_off)
      message = 'Plane at other airport'
      expect{other_airport.take_off(plane)}.to raise_error message
  end

  describe '#planes' do

    before(:each) do
      allow(plane).to receive(:grounded).and_return(false)
      allow(plane).to receive(:landed)
      airport.land(plane)
    end

    it 'confirms a landed plane is at the airport' do
      expect(airport.instance_variable_get(:@planes)).to eq [plane]
    end

    it 'confirms a plane has taken off and is no longer at the airport' do
      allow(plane).to receive(:grounded).and_return true
      allow(plane).to receive(:taken_off)
      airport.take_off(plane)
      expect(airport.instance_variable_get(:@planes)).not_to include plane
    end
  end
end
end
