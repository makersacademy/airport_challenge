require 'airport'

describe Airport do
  let(:plane) { double(:plane) }

  describe "#land" do

    it {expect(subject).to respond_to(:land).with(1).argument}

    it "should receive confirmation that a plane has landed" do
      expect(subject.land(plane)).to eq "Plane ID #{plane} has landed."
    end
  end

  describe "#take_off" do

    it {expect(subject).to respond_to(:take_off).with(1).argument}

    it "should receive confirmation that a plane has taken off" do
      expect(subject.take_off(plane)).to eq "Plane ID #{plane} has taken off."
    end

    it "should prevent take off during stormy weather" do
      allow(subject).to receive(:stormy?).and_return(true)
      subject.land(plane)
      expect{subject.take_off(plane)}.to raise_error("Can not take off during stormy weather.")
    end
  end

end