require 'airport'

describe Airport do

subject(:airport) { described_class.new }
subject(:airport_1) { described_class.new }
let(:plane) { double :plane }

  describe '#land' do

    it 'lands a plane at the airport' do
      good_weather
      plane_in_flight
      expect(airport.land(plane)).to eq [plane]
    end

    it 'raises error if landing attempted in stormy weather' do
      bad_weather
      expect{airport.land(plane)}.to raise_error "Planes cannot land in stormy weather"
    end

    it 'should not allow a grounded plane to land again' do
      good_weather
      plane_landed
      expect{airport.land(plane)}.to raise_error "This plane is already at an airport"
    end

    it 'prevents landing when the airport is full' do
      good_weather
      plane_in_flight
      Airport::DEFAULT_CAPACITY.times { airport.land(plane) }
      expect{airport.land(plane)}.to raise_error "Planes cannot land when airport is full"
    end

  end

  describe '#take_off' do

    it 'makes a plane take off from the airport' do
      good_weather
      plane_in_flight
      airport.land(plane)
      plane_landed
      airport.take_off(plane)
      expect(airport.planes).to eq []
    end

    it 'raises error if takeoff attempted in stormy weather' do
      bad_weather
      expect{airport.take_off(plane)}.to raise_error "Planes cannot take off in stormy weather"
    end

    it 'should not allow a flying plane to take off again' do
      good_weather
      plane_in_flight
      expect{airport.take_off(plane)}.to raise_error "This plane is already flying"
    end

    it 'should not allow a plane to take off unless it is at that airport' do
      good_weather
      plane_in_flight
      airport.land(plane)
      allow(airport_1.weather).to receive(:stormy).and_return(false)
      plane_landed
      expect{airport_1.take_off(plane)}.to raise_error "This plane is not at this airport"
    end

  end

  describe '#planes' do

    it 'has registered landed plane at airport' do
      good_weather
      plane_in_flight
      airport.land(plane)
      expect(airport.planes).to eq [plane]
    end

    it 'confirms that plane is no longer at airport after takeoff' do
      good_weather
      plane_in_flight
      airport.land(plane)
      plane_landed
      airport.take_off(plane)
      expect(airport.planes).not_to include plane
    end

  end

end

private

  def bad_weather
    allow(airport.weather).to receive(:stormy?).and_return(true)
  end

  def good_weather
    allow(airport.weather).to receive(:stormy?).and_return(false)
  end

  def plane_in_flight
    allow(plane).to receive(:grounded).and_return(false)
    allow(plane).to receive(:landed)
  end

  def plane_landed
    allow(plane).to receive(:grounded).and_return true
    allow(plane).to receive(:taken_off)
  end
