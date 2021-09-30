require 'airport'

describe Airport do
  let(:good_weather) { $weather = double("Weather", :stormy => false) }
  let(:bad_weather) { $weather = double("Weather", :stormy => true) }

  context 'landing:' do
    airport = Airport.new(1500)
    let(:plane) { double("Plane", :current_airport => nil, :in_flight? => true) }

    # The same mock Plane object is reused because only the method and capacity is being tested,
    # we are are not concerned about identifying individual planes at this point

    it "lands a plane, updates its airport, and stores it" do
      good_weather
      expect(plane).to receive(:current_airport=).with(1500)
      airport.land(plane)

      expect(airport.planes).to include plane
    end

    it "doesn't land when airport is full" do
      good_weather
      49.times do # 1 plane is already at airport
        allow(plane).to receive(:current_airport=).with(1500)
        airport.land(plane)
      end

      expect { airport.land(plane) }.to raise_error("Airport full")
    end

    it "defaults to a capacity of 50" do
      expect(airport.capacity).to eq(50)
    end

    context 'can only land planes from the sky:' do
      airport3000 = Airport.new(3000)
      let(:plane_in_this_airport) { double("Plane in airport 3000",
      :current_airport => 3000, :in_flight? => false) }
      let(:plane_in_other_airport) { double("Plane in airport 3001", 
      :current_airport => 3001, :in_flight? => false) }

      it "can't land planes in other airports" do
        expect { airport3000.land(plane_in_other_airport)
        }.to raise_error("Plane already at another airport")
      end

      it "can't land a plane already at this airport" do
        expect { airport3000.land(plane_in_this_airport)
        }.to raise_error("Plane already at this airport")
      end
    end
  end

  context 'taking off:' do
    airport = Airport.new(2000)
    let(:plane1) { double("Plane1", :current_airport => nil, :in_flight? => true) }

    it "removes planes from the airport when they take off" do
      good_weather
      allow(plane1).to receive(:current_airport=).with(2000)
      airport.land(plane1)
      allow(plane1).to receive(:in_flight?).and_return(false)
      allow(plane1).to receive(:current_airport).and_return(2000)

      allow(plane1).to receive(:current_airport=).with(nil)
      airport.take_off(plane1)
      allow(plane1).to receive(:current_airport).and_return(nil)

      expect(airport.planes.include?(plane1)).to eq false
    end
    
    it "confirms a plane has departed" do
      expect(airport.confirm_departure(plane1)).to eq("Plane has departed")      
    end

    context 'planes can only take off from their current airport:' do
      let(:plane_in_other_airport) { double("Plane in airport 4000",
      :current_airport => 4000, :in_flight? => false) }
      let(:plane_in_sky) { double("Plane in sky",
      :current_airport => nil, :in_flight? => true) }
      
      it "planes can't take off from another airport" do
        expect { airport.take_off(plane_in_other_airport) 
        }.to raise_error("Plane is at another airport")
      end

      it "planes already flying can't take off" do
        expect { airport.take_off(plane_in_sky)
        }.to raise_error("Plane is already in the sky")
      end
    end
  end
  
  context 'weather:' do
    airport = Airport.new(6000)
    let(:plane) { double("Plane", :current_airport => nil, :in_flight? => true) }

    it "doesn't let planes land if the weather is stormy" do
      bad_weather      
      expect { airport.land(plane) }.to raise_error("Dangerous weather")
    end

    it "doesn't let planes take off if the weather is stormy" do
      good_weather
      allow(plane).to receive(:current_airport=).with(6000)
      airport.land(plane)
      allow(plane).to receive(:current_airport).and_return(6000)
      allow(plane).to receive(:in_flight?).and_return(false)
      bad_weather

      expect { airport.take_off(plane) }.to raise_error("Dangerous weather")
    end
  end

  context 'landing and taking off multiple planes:' do
    airport = Airport.new(999)
    let(:plane1) { double("Plane1", :current_airport => nil, :in_flight? => true) }
    let(:plane2) { double("Plane2", :current_airport => nil, :in_flight? => true) }
    let(:plane3) { double("Plane3", :current_airport => nil, :in_flight? => true) }
    let(:plane4) { double("Plane4", :current_airport => nil, :in_flight? => true) }
    let(:plane5) { double("Plane5", :current_airport => nil, :in_flight? => true) }

    it "has the correct planes" do
      good_weather
      planes = [plane1, plane2, plane3, plane4, plane5]
      planes.each do |plane|
        allow(plane).to receive(:current_airport=).with(999)
        airport.land(plane)
        allow(plane).to receive(:current_airport).and_return(999)
        allow(plane).to receive(:in_flight?).and_return(false)
      end

      departing_planes = [plane1, plane3, plane5]
      departing_planes.each do |plane|
        allow(plane).to receive(:current_airport=).with(nil)
        airport.take_off(plane)
      end

      expect(airport.planes).to eq([plane2, plane4])
    end
  end
end
