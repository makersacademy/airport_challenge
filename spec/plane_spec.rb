require 'plane.rb'

describe Plane do
  describe "Landing" do
    it 'tests whether or not the plane is able to land.' do
      expect(subject.airborne?).to eq true
    end
  end
end
