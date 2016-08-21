require "plane"

describe Plane do


  context "#land" do

    it "is able to land" do
      expect(subject).to respond_to(:land)
    end

    it "should recognise when not in flight" do
      expect(subject.land).to be(false)
    end
  end


  context "#take_off" do

    it "is able to take of" do
      expect(subject).to respond_to(:take_off)
    end

    it "should recognise when in flight" do
      expect(subject.take_off).to be(true)
    end
  end

end


#allow(@bike).to receive(:working?).and_return(true)
