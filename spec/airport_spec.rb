require 'airport'

describe Airport do

  context 'landing:' do
    airport = Airport.new(1500)
    let(:good_weather) { $weather = double("Weather", :stormy => false) }
    let(:plane) { double("Plane", :current_airport => 0) }

    # The same mock Plane object is reused because only the method and capacity is being tested,
    # we are are not concerned about identifying individual planes at this point

    it "lands a plane, updates its airport, and stores it" do
      good_weather
      expect(plane).to receive(:update_airport).with(1500)
      airport.land(plane)

      expect(airport.planes).to include plane
    end

    it "doesn't land when airport is full" do
      good_weather
      49.times do # 1 plane is already at airport
        allow(plane).to receive(:update_airport).with(1500)
        airport.land(plane)
      end

      expect { airport.land(plane) }.to raise_error("Airport full")
    end

    it "defaults to a capacity of 50" do
      expect(airport.capacity).to eq(50)
    end

    it "can only land a plane from the sky" do
      good_weather
      airport3000 = Airport.new(3000)
      plane_in_this_airport = double("Plane in airport 3000", :current_airport => 3000)
      plane_in_other_airport = double("Plane in airport 3001", :current_airport => 3001)

      expect { airport3000.land(plane_in_this_airport)
      }.to raise_error("Plane already at this airport")
      expect { airport3000.land(plane_in_other_airport)
      }.to raise_error("Plane already at another airport")
      # don't need to tell doubles to receive messages because they don't get past the guard clause
    end
  end

  context 'taking off:' do
    airport = Airport.new(2000)
    let(:good_weather) { $weather = double("Weather", :stormy => false) }
    let(:plane1) { double("Plane1", :current_airport => 0) }
    let(:plane2) { double("Plane2", :current_airport => 0) }

    # Weather double is reused because we want it to not be a factor in these tests

    it "removes planes from the airport when they take off" do
      good_weather
      allow(plane1).to receive(:update_airport).with(2000)
      airport.land(plane1)
      allow(plane1).to receive(:current_airport).and_return(2000)

      allow(plane1).to receive(:update_airport).with(0)
      airport.take_off(plane1)
      allow(plane1).to receive(:current_airport).and_return(0)

      expect(airport.planes.include?(plane1)).to eq false
      expect(plane1.current_airport).to eq(0)
    end
    
    it "confirms a plane has departed" do
      good_weather
      plane3 = double("Plane3", :current_airport => 0)
      plane4 = double("Plane4", :current_airport => 0)
      
      allow(plane3).to receive(:update_airport).with(2000)
      allow(plane4).to receive(:update_airport).with(2000)
      airport.land(plane3)
      airport.land(plane4)
      allow(plane3).to receive(:current_airport).and_return(2000)
      allow(plane4).to receive(:current_airport).and_return(2000)

      allow(plane3).to receive(:update_airport).with(0)
      airport.take_off(plane3)
      allow(plane3).to receive(:current_airport).and_return(0)
      # plane3 is back in sky

      expect(airport.confirm_departure(plane3)).to eq("Plane has departed")
      expect(airport.confirm_departure(plane4)).to eq("Plane has not departed")
      
      allow(plane4).to receive(:update_airport).with(0)
      airport.take_off(plane4)
      allow(plane4).to receive(:current_airport).and_return(0)
      # removing the other plane double from the airport for the next test
    end

    it "only lets planes take off from airports they are in" do
      good_weather
      plane_in_other_airport = double("Plane in airport 4000", :current_airport => 4000)
      expect { airport.take_off(plane_in_other_airport) 
      }.to raise_error("Plane is at another airport")
    end

    it "planes already flying can't take off" do
      good_weather
      plane_in_sky = double("Plane in sky", :current_airport => 0)
      expect { airport.take_off(plane_in_sky)
      }.to raise_error("Plane is already in the sky")
    end
  end
  
  context 'weather:' do
    airport = Airport.new(6000)
    let(:bad_weather) { $weather = double("Weather", :stormy => true) }
    let(:plane) { double("Plane", :current_airport => 0) }

    it "doesn't let planes take off or land if the weather is stormy" do
      bad_weather
      allow(plane).to receive(:update_airport).with(6000)
      
      expect { airport.land(plane) }.to raise_error("Dangerous weather")

      allow($weather).to receive(:stormy).and_return(false)
      airport.land(plane)
      allow(plane).to receive(:current_airport).and_return(6000)
      # plane is now in airport
      allow($weather).to receive(:stormy).and_return(true)

      # don't need to tell doubles to receive messages because they don't get past the guard clause
      expect { airport.take_off(plane) }.to raise_error("Dangerous weather")
    end
  end
end
