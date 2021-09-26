require 'airport'

describe Airport do

  context 'landing:' do
    airport = Airport.new(1500)
    let(:plane) { double("Plane", :current_airport => 0) }
    let(:weather) { double("Weather", :stormy => false) }
    
    # The same mock Plane object is reused because only the method and capacity is being tested,
    # we are are not concerned about identifying individual planes at this point

    it "lands a plane and stores it" do
      expect(plane).to receive(:current_airport=).with(1500)
      airport.land(plane, weather)

      expect(airport.planes.length).to eq(1)
    end

    it "doesn't land when airport is full" do
      49.times do # 1 plane is already at airport
        expect(plane).to receive(:current_airport=).with(1500)
        airport.land(plane, weather)
      end

      expect { airport.land(plane, weather) }.to raise_error("Airport full")
    end

    it "defaults to a capacity of 50" do
      expect(airport.capacity).to eq(50)
    end

    it "can only land a plane from the sky" do
      airport3000 = Airport.new(3000)
      plane_in_this_airport = double("Plane in airport 3000", :current_airport => 3000)
      plane_in_other_airport = double("Plane in airport 3001", :current_airport => 3001)

      expect { airport3000.land(plane_in_this_airport, weather)
      }.to raise_error("Plane already at this airport")
      expect { airport3000.land(plane_in_other_airport, weather)
      }.to raise_error("Plane already at another airport")
    end
  end

  context 'taking off:' do
    airport = Airport.new(2000)
    let(:weather) { double("Weather", :stormy => false) }
    let(:plane1) { double("Plane1", :current_airport => 0) }
    let(:plane2) { double("Plane2", :current_airport => 0) }

    # Weather double is reused because we want it to not be a factor in these tests

    it "removes planes from the airport when they take off" do
      allow(plane1).to receive(:current_airport=).and_return(0)
      airport.land(plane1, weather)
      allow(plane1).to receive(:current_airport).and_return(2000)

      airport.take_off(plane1, weather)
      allow(plane1).to receive(:current_airport).and_return(0)

      expect(airport.planes.include?(plane1)).to eq false
      expect(plane1.current_airport).to eq(0)
    end
    
    it "confirms a plane has departed" do
      plane3 = double("Plane3", :current_airport => 0)
      plane4 = double("Plane4", :current_airport => 0)
      
      allow(plane3).to receive(:current_airport=).and_return(0)
      allow(plane4).to receive(:current_airport=).and_return(0)
      # planes are asked for their current airport before landing
      airport.land(plane3, weather)
      airport.land(plane4, weather)
      allow(plane3).to receive(:current_airport).and_return(2000)
      allow(plane4).to receive(:current_airport).and_return(2000)
      # current airport is updated as they land. airport 2000 now has 2 planes
      
      airport.take_off(plane3, weather)
      allow(plane3).to receive(:current_airport).and_return(0)
      # plane3 is back in sky

      expect(airport.confirm_departure(plane3)).to eq("Plane has departed")
      expect(airport.confirm_departure(plane4)).to eq("Plane has not departed")
      
      airport.take_off(plane4, weather)
      allow(plane4).to receive(:current_airport).and_return(0)
      # removing the other plane double from the airport for the next test
    end

    it "only lets planes take off from airports they are in" do
      plane_in_other_airport = double("Plane in airport 4000", :current_airport => 4000)
      expect { airport.take_off(plane_in_other_airport) 
      }.to raise_error("Plane is at another airport")
    end

    it "planes already flying can't take off" do
      plane_in_sky = double("Plane in sky", :current_airport => 0)
      expect { airport.take_off(plane_in_sky)
      }.to raise_error("Plane is already in the sky")
    end
  end
  
  context 'weather:' do
    let(:airport) { Airport.new(6000) }
    let(:plane) { double("Plane", :current_airport => 0) }
    let(:bad_weather) { double("Weather", :stormy => true) }
    let(:good_weather) { double("Weather", :stormy => false) }

    it "doesn't let planes take off or land if the weather is stormy" do
      allow(plane).to receive(:current_airport=).and_return(0)

      expect { airport.land(plane, bad_weather) }.to raise_error("Dangerous weather")

      airport.land(plane, good_weather)
      allow(plane).to receive(:current_airport).and_return(6000)
      # plane is now in airport

      expect { airport.take_off(plane, bad_weather) }.to raise_error("Dangerous weather")
    end
  end
end
