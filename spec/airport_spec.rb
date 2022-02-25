require 'airport'

describe Airport do
  let(:serial_number) { 25_817 }
  let(:airport) { Airport.new("Heathrow") }
  let(:plane) { instance_double(Plane, :serial_number => serial_number) }
  
  before do
    allow(plane).to receive(:change_location).with(any_args)
  end

  it 'has a default capacity' do
    expect(airport.report_capacity).to eq Airport::DEFAULT_CAPACITY
  end
  
  it 'can check if it is full' do
    expect { airport.full? }.to_not raise_error
  end

  it 'can check for stormy weather' do
    expect(airport.stormy?).to be(true).or be(false)
  end

  describe '#land' do
    it 'can have planes land at it' do
      expect { airport.land(plane) }.to_not raise_error
    end

    it 'prevents planes landing when the airport is full' do
      expect do
        (Airport::DEFAULT_CAPACITY + 1).times { airport.land(plane) }
      end.to raise_error 'Airport is full'
    end

    it 'prevents planes from landing when weather is stormy' do
      airport.weather_update("Stormy")
      expect do
        airport.land(plane)
      end.to raise_error 'Cannot land during stormy weather'
    end
  end

  describe '#weather_update' do
    it 'can receive a weather update' do
      expect { airport.weather_update("Sunny") }.to_not raise_error
    end
  end

  describe '#take_off' do
    it 'allows planes to take off' do
      airport.land(plane)
      expect { airport.take_off(serial_number) }.to_not raise_error
    end

    it 'removes the plane once it takes off' do
      airport.land(plane)
      airport.take_off(serial_number)
      expect(airport.list_planes).to_not include(plane)
    end

    it 'prevents a plane that is not at the airport from taking off' do
      expect do
        airport.take_off(serial_number)
      end.to raise_error 'Plane not found at this airport'
    end
  end
end
