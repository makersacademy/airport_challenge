require 'Airport'

describe Airport do
  subject(:airport) { described_class.new }
  let(:plane) { double :plane }
  let(:bad_weather) { double(stormy?: true) }
  let(:good_weather) { double(stormy?: false) }

  describe '#land' do
    it 'has the plane once landed' do
      airport = Airport.new(20, good_weather)
      airport.land(plane)
      expect(airport.hangar).to include plane
    end

    it "should raise error if trying to land with bad weather" do
      # allow(airport).to receive(:weather_check) { true }
      airport = Airport.new(20, bad_weather)
      error = "Stormy weather conditions are preventing landing"
      expect { airport.land(plane) }.to raise_error error
    end
    it "should raise error if trying to land when airport is full" do
      airport = Airport.new(20, good_weather)
      allow(airport).to receive(:full?) { true }
      expect { airport.land(plane) }.to raise_error "Airport already full"
    end
  end

  describe '#take_off' do
    it "doesn't have the plane once taken off" do
      airport = Airport.new(20, good_weather)
      airport.take_off(plane)
      expect(airport.hangar).not_to include plane
    end

    it "should raise error if trying to take off with bad weather" do
      airport = Airport.new(20, bad_weather)
      error = "Stormy weather conditions are preventing take off"
      expect { airport.take_off(plane) }.to raise_error error
    end
  end
end
