require 'plane.rb'
require 'airport.rb'

describe Plane do

  describe ".airbourne" do
    it "checks if plane is in air" do
      expect(subject).to respond_to :airbourne
      plane = Plane.new
      expect(plane.airbourne).to eq true
    end
  end
end
