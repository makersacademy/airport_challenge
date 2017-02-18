require 'airport'
require 'plane'

describe Airport do

  describe 'initialization' do
    it "is initialized with an empty array of planes" do
      expect(subject.planes).to eq []
    end

    it "is initialized with a default capacity of 10" do
      expect(subject.capacity).to eq 10
    end

    it "allows the user to overide the default capacity when creating a new airport" do
      expect((Airport.new 20).capacity).to eq 20
    end

  end
  it "can keep track of a plane that has landed" do
    plane = Plane.new
    airport = Airport.new
    plane.land(airport)
    expect(airport.planes).to eq [plane]
  end

    describe '.full?' do
      it "checks if the airport is full" do
        10.times {(Plane.new).land(subject)}
        expect(subject.full?).to eq true
      end
    end


end
