require_relative '../lib/airport'

describe Airport do

  AIRPORT_CAPACITY = 10
  FULL_CAPACITY_ERROR_MSG = 'Airport at full capacity.'
  STORMY_WEATHER_ERROR_MSG = 'Weather is stormy.'

  let(:plane) { double(:plane) }
  let(:stormy_weather) { double(:weather, :stormy? => true) }
  let(:good_weather) { double(:weather, :stormy? => false) }
  subject(:airport) { described_class.new(good_weather)}

  describe 'initialization' do
    it 'defaults capacity of airport' do
      described_class::DEFAULT_CAPACITY.times { subject.land(plane) }
      expect { airport.land(plane) }.to raise_error FULL_CAPACITY_ERROR_MSG
    end

    it 'sets capacity to something other than the default capacity' do
      non_default_capacity_airport = described_class.new(good_weather, AIRPORT_CAPACITY)
      AIRPORT_CAPACITY.times { non_default_capacity_airport.land(plane) } 
      expect { non_default_capacity_airport.land(plane) }.to raise_error FULL_CAPACITY_ERROR_MSG
    end
  end

  describe "#take_off" do
    it "takes one argument" do
      expect(airport).to respond_to(:take_off).with(1).argument
    end

    it "takes off a plane at the airport if weather is good" do
      expect { airport.take_off(plane) }.not_to raise_error
    end

    it "prevents takeoff if the weather is stormy" do
      stormy_airport = described_class.new(stormy_weather)
      expect { stormy_airport.take_off(plane) }.to raise_error STORMY_WEATHER_ERROR_MSG
    end

    it "reduces the number of planes in the airport by 1 on take off" do
      
    end
  end 

  describe "#land" do
    it "takes one argument" do
      expect(airport).to respond_to(:land).with(1).argument
    end

    it "lands a plane at the airport if weather is good" do
      expect { airport.land(plane) }.not_to raise_error
    end

    it "prevents landing if the weather is stormy" do
      stormy_airport = described_class.new(stormy_weather)
      expect { stormy_airport.land(plane) }.to raise_error STORMY_WEATHER_ERROR_MSG
    end

  end 

end
