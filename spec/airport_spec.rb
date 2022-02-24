require 'airport'
require 'plane'

plane = Plane.new

describe Airport do
    describe "planes landing" do
      it { is_expected.to respond_to(:land).with(1).argument }

        context "adding stormy weather variable"
          it "checks for current weather"  do
          airport = Airport.new
          allow(airport).to receive(weather?).and_return("Stormy") 
          end

        context "adding default airport capacity"
          it "returns the default capacity of an airport" do
          airport = Airport.new
          expect(airport.capacity).to eq 5
          end

          it "returns the new capacity manually set for an airport" do
          airport = Airport.new(3)
          expect(airport.capacity).to eq 3
          end

          it "raises an error if landing a plane when airport is full" do
          airport = Airport.new
          airport.capacity.times { subject.land(Plane.new) }
          expect { subject.land(Plane.new) }.to raise_error("Cannot land anymore plane, airport is full.")
          end
    end

    describe "planes taking off" do
      it { is_expected.to respond_to(:take_off).with(1).argument }
    
      it "returns the plane taking off" do
      expect(subject.take_off(plane)).to eq(plane) 
      end
    end
end