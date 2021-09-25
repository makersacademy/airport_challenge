require 'airport'

describe Airport do

  context 'landing:' do
    airport = Airport.new(1500)
    let(:plane) { double("Plane", :current_airport => 0) }
    let(:weather) { weather = double("Weather", :stormy => false) }
    
    # The same mock Plane object is reused because only the method and capacity is being tested,
    # we are are not concerned about identifying individual planes at this point

    it "lands a plane and stores it" do
      expect(plane).to receive(:current_airport=).with(1500)
      airport.land(plane, weather)
      expect(airport.hangar.length).to eq(1)
    end
    it "doesn't land when airport is full" do
      49.times do # 1 plane is already in hangar
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

      expect { airport3000.land(plane_in_other_airport, weather)
      }.to raise_error("Plane already at another airport")
      expect { airport3000.land(plane_in_this_airport, weather)
      }.to raise_error("Plane already at this airport")
    end
  end

  context 'taking off:' do
    airport = Airport.new(2000)
    let(:weather) { double("Weather", :stormy => false) }
    let(:plane1) { double("Plane1", :current_airport => 0) }
    let(:plane2) { double("Plane2", :current_airport => 0) }

    # Weather double is reused because we want it to not be a factor in these tests

    it "removes planes from the hangar when they take off" do
      allow(plane1).to receive(:current_airport=).and_return(0)
      airport.land(plane1, weather)
      allow(plane1).to receive(:current_airport).and_return(2000)

      airport.take_off(plane1, weather)
      allow(plane1).to receive(:current_airport).and_return(0)

      expect(airport.hangar.include?(plane1)).to eq false
      expect(plane1.current_airport).to eq 0
    end

    it "confirms a plane has departed" do
      plane3 = double("Plane3", :current_airport => 0)
      plane4 = double("Plane3", :current_airport => 0)
      
      allow(plane3).to receive(:current_airport=).and_return(0)
      allow(plane4).to receive(:current_airport=).and_return(0)
      airport.land(plane3, weather)
      airport.land(plane4, weather)
      allow(plane3).to receive(:current_airport).and_return(2000)
      allow(plane4).to receive(:current_airport).and_return(2000)
      
      airport.take_off(plane3, weather)
      allow(plane3).to receive(:current_airport).and_return(0)

      expect(airport.confirm_departure(plane3)).to eq("Plane has departed")
      expect(airport.confirm_departure(plane4)).to eq("Plane has not departed")
    end

    it "only lets planes take off from airports they are in" do
      plane_in_other_airport = double("Plane in airport 4000", :current_airport => 4000)
      expect { airport.take_off(plane_in_other_airport) 
      }.to raise_error("Plane is at a different airport")
    end

    it "planes already flying can't take off" do
      plane_in_sky = double("Plane in sky", :current_airport => 0)
      expect { airport.take_off(plane_in_sky)
      }.to raise_error("Plane is already in sky")
    end

  end
  
  context 'weather:' do
    let(:airport) { Airport.new(6000) }
    let(:plane) { double("Plane", :current_airport => 0) }
    let(:weather) { weather = double("Weather", :stormy => true) }

    it "doesn't let planes take off or land if the weather is bad" do
      allow(plane).to receive(:current_airport=).and_return(0)

      expect { airport.land(plane, weather) }.to raise_error("Dangerous weather")

      allow(plane).to receive(:current_airport).and_return(6000)

      expect { airport.take_off(plane, weather) }.to raise_error("Dangerous weather")
    end
  end
end
