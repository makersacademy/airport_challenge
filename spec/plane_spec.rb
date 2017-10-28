require "plane"

describe Plane do

  let(:plane) { Plane.new }

  describe "initialize plane" do

    it "allows a plane to exist" do
      expect(Plane.new).to be_an_instance_of(Plane)
    end

  end

end
