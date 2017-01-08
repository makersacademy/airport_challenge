require 'Airport'

describe Airport do
  let(:airport) { Airport.new }
  let(:plane) { double(:plane, land!: nil) }

  it 'initialises without planes' do
    expect(airport.planes).to eq []
  end

  it 'can check the weather' do
    possible_weather = ["sunny", "stormy"]
    expect(possible_weather).to include(airport.weather)
  end

  it 'initialises with default capacity of 2' do
    expect(airport.capacity).to eq 2
  end

  it 'can be initialised with a manually entered capacity' do
    large_airport = Airport.new(default_capacity: 10)
    expect(large_airport.capacity).to eq 10

  end

  context "when the weather is sunny" do
    before do
      allow(airport).to receive(:weather).and_return('sunny')
    end

    it 'plane can land at the airport' do
      expect(plane).to receive(:land!)
      airport.land(plane)
      expect(airport.planes).to eq [plane]
    end

    it 'allows a plane to take off' do
      airport.land(plane)
      expect(plane).to receive(:take_off!)
      airport.take_off(plane)
      expect(airport.planes).to eq []
    end

    it 'prevents landing when airport is full' do
      airport.capacity.times { airport.land(plane) }
      expect{ airport.land(plane) }
      .to raise_error("Sorry, airport full!")
    end
  end

  context "when the weather is stormy" do
    before do
      allow(airport).to receive(:weather).and_return('stormy')
    end

    it 'prevents landing' do
      expect{ airport.land(plane) }
      .to raise_error("Too stormy to land!")
    end

    it 'prevents take off' do
      expect{ airport.take_off(plane) }
      .to raise_error("Too stormy to take off!")
    end
  end
end
