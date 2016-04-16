require "airport"

describe Airport do
  let(:plane) {Plane.new}
  # let(:weather) {Weather.new}

  describe "#land" do

    it {should respond_to(:land).with(1).argument}

    it "it should accept a plane and confirm it has landed" do
      subject.land(plane)
      expect(subject.planes).to eq [plane]
    end

  #   it "it should raise an error & prevent landing when stormy" do
  #     weather = double(:weather, stormy?: true)
  #     # allow(Weather).to receive(:stormy?).and_return(true)
  #     expect{subject.land(plane)}.to raise_error("too stormy for landing")
  #   end
  end

  describe "#take_off" do

    it {should respond_to(:take_off).with(1).argument}

    it "plane should take off and confirm it is no longer at the Airport" do
      expect(subject.planes).to be_empty
    end

    # it "it should raise an error & prevent take off when stormy" do
    #   weather = double(:weather, stormy?: true)
    #   # allow(Weather).to receive(:stormy?).and_return(true)
    #   expect{subject.take_off(plane)}.to raise_error("too stormy for take off")
    # end
  end
end
