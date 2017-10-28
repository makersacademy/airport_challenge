require "plane"

describe Plane do

  let(:plane) { Plane.new }

  describe "initialize plane" do

    it "allows a plane to exist" do
      expect(Plane.new).to be_an_instance_of(Plane)
    end

    it "allows a plane to exist passing one argument, flying status" do
      expect(Plane).to respond_to(:new).with(1).argument
    end

  end

  describe "flying" do

    it "expects a plane to respond to flying method" do
      expect(plane).to respond_to(:flying)
    end

    it "expects flying method to return false to a newly created plane" do
      expect(plane.flying). to eq false
    end

  end

end
