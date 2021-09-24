require 'airport'

describe Airport do

  context 'landing planes' do
    let(:airport) { Airport.new }
    it "lands a plane and stores it" do
      plane = double("Plane")
      airport.land(plane)
      expect(airport.hangar.length).to eq(1)
    end
    it "doesn't land when airport is full" do
      50.times { airport.land(double("Plane")) }
      expect { airport.land(double("Plane")) }.to raise_error("Airport full")
    end
    it "defaults to a capacity of 50" do
      expect(airport.capacity).to eq(50)
    end
  end

  context 'flying planes' do
    let(:airport) { Airport.new }
    it "can tell planes to take off" do
      plane = double("Plane")
      expect{airport.take_off(plane)}.not_to raise_error
    end
    it "removes planes from the hangar when they take off" do
      plane_1 = (double("Plane"))
      plane_2 = (double("Plane2"))
      airport.take_off(plane_1)
      expect(airport.hangar.include?(plane_1)).to eq false
    end
  end
  
  # context 'weather' do
  #   let(:airport) { Airport.new }
  #   it "knows the current weather" do
  #     expect(airport).to respond_to(:weather)
  #   end
  # end
end