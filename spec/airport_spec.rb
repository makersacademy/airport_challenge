require 'airport.rb'

describe Airport do

  class FlyingPlane

  end

  subject { Airport.new }

  context "Checks Capacity" do
    it "Raise an error if the Airport is full" do
      expect{ 52.times{ subject.land(FlyingPlane.new)}}.to raise_error("Cannot land, airport at capacity")
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
