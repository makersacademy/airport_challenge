require 'airport.rb'

describe Airport do

  class FlyingPlane

  end

  subject { Airport.new }

  context "Checks Capacity" do
    plane = FlyingPlane.new
    it "Raise an error if the Airport is full" do
      expect{ 52.times{ subject.land(plane)}}.to raise_error("Cannot land, airport at capacity")
    end
    it "Lands the planes when above capacity" do
      expect( 12.times{ subject.land(plane).landed_planes.count } ).to eq(12)
    end
    it "Lands all the planes up to the capacity" do
      expect( 50.times{ subject.land(plane).landed_planes.count } ).to eq(50)
    end
  end

  context "When trying to land a plane" do
   it {expect(subject.landed_planes).to be_a(Array)}
   it 'Land a plane that is flying' do
     subject.land(FlyingPlane.new)
     expect(subject.landed_planes[-1]).to be_a(FlyingPlane)
   end

  end

end
