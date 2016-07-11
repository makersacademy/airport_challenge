require 'airport'

describe Airport do

  subject(:airport) { Airport.new }
  subject(:plane) { Plane.new }

  context "...IN FAIR WEATHER..." do
  
    describe "planes can land at the airport" do
  
      it "allows landing" do
        allow(airport).to receive(:adverse_weather?).and_return(false)
        expect(airport.land(plane)).to include plane
      end

      it "knows if a plane has landed" do
        allow(airport).to receive(:adverse_weather?).and_return(false)
        airport.land(plane)
        expect(airport.planes).to include plane
      end
      
      it "prevents landing when it's full" do
        allow(airport).to receive(:adverse_weather?).and_return(false)
        airport = Airport.new(1)
        airport.land(plane)
        expect{airport.land(plane)}.to raise_error("Full")
      end
    end

    describe "planes can take-off from the airport" do
    
      before do
        plane = Plane.new
        airport = Airport.new
        airport.land(plane)
      end

      it 'should tell a plane to take-off' do
        allow(airport).to receive(:adverse_weather?).and_return(false)
        expect(airport).to respond_to(:take_off)
      end

      it 'should know when a plane has taken-off' do
        # allow(airport.weather).to receive(:stormy?) {false}
        allow(airport).to receive(:adverse_weather?).and_return(false)
        airport.take_off(plane)
        expect(airport.planes).not_to eq plane
      end
        
      it 'only allows planes that have landed to take-off' do
        allow(airport.weather).to receive(:stormy?) {false}
        plane_2 = Plane.new
        error = "Error: that plane isn't at this airport"
        expect{airport.take_off(plane_2)}.to raise_error error
      end
        
      it 'does not allow planes that are already flying to take-off' do
        allow(airport.weather).to receive(:stormy?) {false}
        plane_2 = Plane.new
        airport.land(plane_2)
        airport.take_off(plane_2)
        error = "Error: that plane isn't at this airport"
        expect{airport.take_off(plane_2)}.to raise_error error
      end
        
      it 'knows when mulitple planes have taken-off' do
        allow(airport.weather).to receive(:stormy?) {false}
        plane_a = Plane.new
        plane_b = Plane.new
        plane_c = Plane.new
        airport.land plane_a
        airport.land plane_b
        airport.land plane_c
        airport.take_off plane_b
        expect(airport.planes).not_to include (plane_b)
      end
    end
  end
  
  context "... IN ADVERSE WEATHER..." do
     
   let(:plane) { Plane.new }
     
    it 'planes are unable to take off' do
     airport = Airport.new
     plane = Plane.new
     airport.land(plane)
     allow(airport).to receive(:adverse_weather?).and_return(true)
     # require "pry"; binding.pry 
     expect{airport.take_off(plane)}.to raise_error("Storm")
   end
   
   it 'planes are unable to land' do
     allow(airport).to receive(:adverse_weather?).and_return(true)
     expect{airport.land(plane)}.to raise_error("Storm")
   end
 
 end
end
