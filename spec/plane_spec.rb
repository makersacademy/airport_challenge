require_relative '../lib/plane'
require_relative '../lib/airport'

describe Plane do

  describe "#initialize" do
    it "should create a parameter of in_air and set it to true when a new plane is created" do
      plane = Plane.new
      expect(plane.in_air).to eq true
    end
  end
end
