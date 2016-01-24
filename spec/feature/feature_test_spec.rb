require 'airport'
require 'plane'

describe "Feature test" do
  describe "Planes can land at an airport if not stormy" do
    airport = Airport.new
    plane = Plane.new
    
    it "can't land in stormy weather" do
      allow(airport).to receive(:weather) {:sunny}    
      plane.take_off(airport)
      allow(airport).to receive(:weather) {:stormy}
      expect {plane.land(airport)}.to raise_error "It is too stormy to land." 
    end
    
    it "can land in other weather" do
      allow(airport).to receive(:weather) {:sunny}
      plane.take_off(airport)
      expect(plane.land(airport)).to eq "Plane has touched down!!"
    end
  end
  
  describe "Planes can take off from an airport if not stormy" do
    airport = Airport.new
    plane = Plane.new
    
    it "can't take off in stormy weather" do
      allow(airport).to receive(:weather) {:stormy}
      expect{plane.take_off(airport)}.to raise_error
    end
    
    it "can take off in other weather" do
      allow(airport).to receive(:weather) {:sunny}
      plane.land(airport)
      expect(plane.take_off(airport)).to eq "Plane has taken off!!"
    end
  end
  
  describe "Planes can't land if airport is full" do
    airport = Airport.new
    plane = Plane.new
    
    it "stops planes from landing" do
      allow(airport).to receive(:weather) {:sunny}
      15.times {airport.landed(plane)}
      expect {airport.landed(plane)}.to raise_error "Airport is full."
    end
  end
  
  describe 'takes off and lands a number of planes' do
    planes = []
    gatwick = Airport.new
    jfk = Airport.new
    10.times {planes << Plane.new}
    it "lands multiple planes" do
      allow(gatwick).to receive(:weather) {:sunny}
      allow(jfk).to receive(:weather) {:snow}
    
      planes.each do |plane|
        plane.take_off(gatwick)
      end
    
    expect(gatwick.planes.count).to eq 0
    
    planes.each do |plane|
      plane.land(jfk)
    end
    expect(jfk.planes.count).to eq 10
    end
  end
end