require_relative '../lib/airport'

describe Airport do
# TO DO refactor to bring out stormy and fine weather conditions

  AIRPORT_CAPACITY = 10
  FULL_CAPACITY_ERR = 'Airport at full capacity.'
  STORMY_WEATHER_ERR = 'Weather is stormy.'
  PLANE_NOT_AT_AIRPORT_ERR = 'Plane not at airport'
  PLANE_IS_ON_LAND_ERR = "Plane is already on the tarmac"

  let(:plane) { Plane.new }
  let(:weather) { double(:weather, :stormy? => false) }
  
  subject(:airport) { described_class.new(weather) }

  describe 'initialization' do

    before(:each) do
      allow(plane).to receive(:flying?).and_return(true)
    end

    it 'defaults capacity of airport' do
      described_class::DEFAULT_CAPACITY.times do
        airport.land(plane)
      end 
      expect { airport.land(plane) }.to raise_error FULL_CAPACITY_ERR
    end

    it 'sets capacity to something other than the default capacity' do
      non_default_capacity_airport = described_class.new(weather, AIRPORT_CAPACITY)
      AIRPORT_CAPACITY.times do
        non_default_capacity_airport.land(plane)
      end  
      expect { non_default_capacity_airport.land(plane) }.to raise_error FULL_CAPACITY_ERR
    end
  end

  describe "#take_off" do
    
    it "confirms that the plane is no longer in the airport after take off" do
      airport.land (plane)
      airport.take_off(plane)
      expect { airport.take_off(plane) }.to raise_error PLANE_NOT_AT_AIRPORT_ERR
    end

    it "confirms that the plane has taken off from the airport" do
      airport.land(plane)
      flying_plane = airport.take_off(plane)
      expect(flying_plane).to be_flying
    end

    it "confirms that the plane is in this actual airport so it can take off" do
      test_plane = Plane.new
      other_airport = Airport.new(weather)
      other_airport.land(test_plane)
      this_airport = Airport.new(weather)
      expect { this_airport.take_off(test_plane) }.to raise_error PLANE_NOT_AT_AIRPORT_ERR
    end

  end 

  describe "#land" do

    it "confirms that the plane has landed at the airport" do
      airport.land (plane)
      expect(plane).not_to be_flying
    end

    it "confirms that a landed plane cannot land" do
      airport.land (plane)
      expect { airport.land (plane) }.to raise_error PLANE_IS_ON_LAND_ERR
    end

  end 

  context "stormy weather" do
    let(:stormy_weather) { double(:weather, :stormy? => true) }

    describe "#take_off" do
      it "prevents takeoff if the weather is stormy" do
        airport = described_class.new(stormy_weather)
        expect { airport.take_off(plane) }.to raise_error STORMY_WEATHER_ERR
      end
    end

    describe "#land" do
      it "prevents landing if the weather is stormy" do
        airport = described_class.new(stormy_weather)
        expect { airport.land(plane) }.to raise_error STORMY_WEATHER_ERR
      end
    end
  end

end
