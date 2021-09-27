require "plane"

RSpec.describe Plane do
  let(:airport){double(:airport, :accept? => true, :receive => true)}
  let(:unaccepting_airport){double :airport, :accept? => false}
  


  describe "#land" do
    it "lands plane at airport if valid airport" do
      allow(airport).to receive(:receive).with(subject).and_return(true)
      expect(subject.land(airport)).to eq(true)
    end

    it "doesn't land at invalid airport" do
      expect(subject.land("not an airport")).to eq(false)
      expect(subject.landed).to eq(false)
    end


    it "doesn't try to land if already landed" do
      allow(airport).to receive(:receive).with(subject).and_return(true)
      subject.land(airport)
      expect(subject.land(airport)).to eq false
    end
  end

  describe "#takeoff" do
    it "sets the landed status to false" do
      allow(airport).to receive(:receive).with(subject).and_return(true)
      subject.land(airport)
      subject.takeoff
      expect(subject.landed).to eq(false)
    end

  end

end
