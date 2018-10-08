require 'airport'
require 'pry'

describe Airport do
  let(:airport) { Airport.new(Airport::DEFAULT_CAPACITY) }
  let(:good_weather) { double(:weather, check_weather: "sunny") }
  let(:bad_weather) { double(:weather, check_weather: "stormy") }

  it 'checks the default capacity of the airport is 20' do
    expect(airport.capacity).to eq Airport::DEFAULT_CAPACITY
  end
  it 'allows the capacity of the airport to be changed' do
    airport = Airport.new(50)
    expect(airport.capacity).to eq 50
  end

  describe '#planes_count' do
    it 'counts a plane that landed' do
      airport.land(good_weather)
      expect(airport.planes_count).to eq 1
    end

    it "counts 2 planes that landed" do
      2.times{ airport.land(good_weather) }
      expect(airport.planes_count).to eq 2
    end

    it "counts that a plane has taken off" do
      airport.land(good_weather)
      airport.take_off(good_weather)
      expect(airport.planes_count).to eq 0
    end
  end

  describe '#land' do
    it 'allows a plane to land at an airport' do
      expect(airport.land(good_weather)).to eq "The plane has landed"
    end
    it 'will not allow a plane to land if the weather is stormy' do
      forcast = bad_weather.check_weather
      expect { airport.land(forcast) }.to raise_error "The weather is stormy"
    end
    it 'raises an exception when the maximum of default planes have landed' do
      Airport::DEFAULT_CAPACITY.times { airport.land(good_weather) }
      expect { airport.land(good_weather) }.to raise_exception "The airport is full"
    end
    it 'raises an exception when the maximum of 50 planes have landed' do
      airport = Airport.new(50)
      50.times { airport.land(good_weather) }
      expect { airport.land(good_weather) }.to raise_exception "The airport is full"
    end
  end

  describe '#take_off' do
    it 'allows a plane to take off and shows that the plane has left' do
      airport.land(good_weather)
      expect(airport.take_off(good_weather)).to eq "The plane has taken off"
    end
    it 'will not allow the plane to take off if the weather is stormy' do
      airport.land(good_weather)
      forcast = bad_weather.check_weather
      expect { airport.take_off(forcast) }.to raise_exception "The weather is stormy"
    end
    it 'will only allow a plane to take off if there is one' do
      expect { airport.take_off(good_weather) }.to raise_exception "There is no planes here"
    end
  end
end
