require_relative '../lib/airport'

describe Airport do

  AIRPORT_CAPACITY = 10

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
      expect { airport.land(plane) }.to raise_error 'Airport at full capacity.'
    end

    it 'sets capacity to something other than the default capacity' do
      non_default_capacity_airport = described_class.new(weather, AIRPORT_CAPACITY)
      AIRPORT_CAPACITY.times do
        non_default_capacity_airport.land(plane)
      end  
      expect { non_default_capacity_airport.land(plane) }.to raise_error 'Airport at full capacity.'
    end

  end

  describe "#take_off" do
    
    it "confirms that the plane is no longer in the airport after take off" do
      airport.land (plane)
      airport.take_off(plane)
      expect { airport.take_off(plane) }.to raise_error 'Plane not at airport'
    end

    it "confirms that the plane has taken off from the airport" do
      airport.land(plane)
      expect(airport.take_off(plane)).to be_flying
    end

    it "confirms that the plane if it is in another airport it can not take off from a different airport" do

      other_airport = Airport.new(weather)
      other_airport.land(plane)
      this_airport = Airport.new(weather)
      other_plane = Plane.new
      this_airport.land(other_plane)
      expect { this_airport.take_off(plane) }.to raise_error 'Plane not at airport'
    end

    it "confirms that a specific plane can take off from the airport" do
      plane_one = Plane.new
      plane_two = Plane.new
      plane_three = Plane.new

      airport.land(plane_one)
      airport.land(plane_two)
      airport.land(plane_three)

      expect(airport.take_off(plane_two)).to be(plane_two) 
    end

  end 

  describe "#land" do

    it "confirms that the plane has landed at the airport" do
      airport.land (plane)
      expect(plane).not_to be_flying
    end

    it "confirms that a landed plane cannot land" do
      airport.land (plane)
      expect { airport.land (plane) }.to raise_error "Plane is already on the tarmac"
    end

  end 

  context "stormy weather" do
    let(:stormy_weather) { double(:weather, :stormy? => true) }

    describe "#take_off" do
      it "prevents takeoff if the weather is stormy" do
        airport = described_class.new(stormy_weather)
        expect { airport.take_off(plane) }.to raise_error 'Weather is stormy.'
      end
    end

    describe "#land" do
      it "prevents landing if the weather is stormy" do
        airport = described_class.new(stormy_weather)
        expect { airport.land(plane) }.to raise_error 'Weather is stormy.'
      end
    end
  end

end
