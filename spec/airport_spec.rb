require_relative '../lib/airport'

describe Airport do
#TO DO refactor to bring out stormy and fine weather conditions

  AIRPORT_CAPACITY = 10
  FULL_CAPACITY_ERROR = 'Airport at full capacity.'
  STORMY_WEATHER_ERROR = 'Weather is stormy.'
  PLANE_NOT_AT_AIRPORT_ERROR = 'Plane not at airport'

  let(:plane) { double(:plane) }
  let(:weather) { double(:weather, :stormy? => false) }
  
  subject(:airport) { described_class.new(weather)}

  describe 'initialization' do
    it 'defaults capacity of airport' do
      described_class::DEFAULT_CAPACITY.times { subject.land(plane) }
      expect { airport.land(plane) }.to raise_error FULL_CAPACITY_ERROR
    end

    it 'sets capacity to something other than the default capacity' do
      non_default_capacity_airport = described_class.new(weather, AIRPORT_CAPACITY)
      AIRPORT_CAPACITY.times { non_default_capacity_airport.land(plane) } 
      expect { non_default_capacity_airport.land(plane) }.to raise_error FULL_CAPACITY_ERROR
    end
  end

  describe "#take_off" do
    it "takes off a plane at the airport" do
      airport.land (plane)
      expect { airport.take_off(plane) }.not_to raise_error
    end

    it "confirms that the plane is no longer in the airport after take off" do
      plane_one = plane
      airport.land (plane_one)
      
      airport.take_off(plane_one)
      expect { airport.take_off(plane_one) }.to raise_error PLANE_NOT_AT_AIRPORT_ERROR
    end
  end 

  describe "#land" do

    it "lands a plane at the airport" do
      expect { airport.land(plane) }.not_to raise_error
    end

  end 

  context "stormy weather" do
    let(:stormy_weather) { double(:weather, :stormy? => true) }

    describe "#take_off" do
      it "prevents takeoff if the weather is stormy" do
        airport = described_class.new(stormy_weather)
        expect { airport.take_off(plane) }.to raise_error STORMY_WEATHER_ERROR
      end
    end

    describe "#land" do
      it "prevents landing if the weather is stormy" do
        airport = described_class.new(stormy_weather)
        expect { airport.land(plane) }.to raise_error STORMY_WEATHER_ERROR
      end
    end
  end




end
