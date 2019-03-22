require "plane"

describe Plane do
  describe "#land" do
    it { is_expected.to respond_to(:land).with(1).argument }
    
    it "lands a plane when requested and weather is clear and there is space in the airport" do

    end

    it "reject landing when wheather is stormy and airport have space" do

    end

    it "reject landing when weather is not stormy and airport is full" do

    end

    it "reject landing when airport is full and weather stormy" do

    end
  end

  describe "#take_off" do
    it "takes off from the airport in wich is and weather is not stormy" do

    end

    it "rise an error when is not in the given airport" do

    end

    it "reject take off when is in the right airpot but weather is stormy" do

    end
  end
end
