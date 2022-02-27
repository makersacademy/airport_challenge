require 'airport'

describe Airport do
  let(:serial_number) { 25_817 }
  let(:airport) { Airport.new("Heathrow") }
  let(:plane) { instance_double("Plane", :serial_number => serial_number) }
  let(:weather) { instance_double(Weather, :weather_report => "Sunny") }

  before do
    allow(plane).to receive(:location=).with(any_args)
  end

  it 'has a default capacity' do
    expect(airport.capacity).to eq Airport::DEFAULT_CAPACITY
  end

  it 'prints the make and serial of the current planes' do
    allow(plane).to receive(:registration).and_return({ make: 'Boeing', serial: 25_817 })
    output = String.new
    2.times do
      airport.land(plane)
      output << "{:make=>\"Boeing\", :serial=>25817}\n"
    end
    expect { airport.print_planes }.to output(output).to_stdout
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
      allow(weather).to receive(:weather_report).and_return("Stormy")
      airport.update_weather(weather)
      expect do
        airport.land(plane)
      end.to raise_error 'Cannot land during stormy weather'
    end
  end

  describe '#update_weather' do
    it 'can fetch a weather update' do
      allow(weather).to receive(:weather_report).and_return("Specific Weather")
      expect(airport.update_weather(weather)).to eq "Specific Weather"
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
      expect(airport.contains_plane?(serial_number)).to be false
    end

    it 'prevents a plane that is not at the airport from taking off' do
      expect do
        airport.take_off(serial_number)
      end.to raise_error 'Plane not found at this airport'
    end

    it 'prevents planes from taking off when weather is stormy' do
      airport.land(plane)
      allow(weather).to receive(:weather_report).and_return("Stormy")
      airport.update_weather(weather)
      expect do
        airport.take_off(serial_number)
      end.to raise_error 'Cannot take off during stormy weather'
    end
  end
end
