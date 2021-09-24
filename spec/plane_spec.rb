require "plane"

RSpec.describe Plane do
  let(:airport){double(:airport, :accept? => true)}
  let(:unaccepting_airport){double :airport, :accept? => false}
  


  describe "#land" do
    it "lands plane at airport if valid airport" do
      allow(airport).to receive(:receive).with(subject).and_return(subject)
      expect(subject.land(airport)).to eq(subject)
    end

    it "doesn't land at invalid airport" do
      allow(airport).to receive(:receive).with(subject).and_return(subject)
      expect(subject.land("not an airport")).to eq(false)
    end

    it "only lands if airport allows it" do
      allow(airport).to receive(:receive).with(subject).and_return(subject)
      expect(subject.land(airport)).to eq(subject)

      expect(subject.land(unaccepting_airport)).to eq(false)
    end

    it "sends itself to the airport" do
      allow(airport).to receive(:receive).with(subject).and_return(subject)
      expect(subject.land(airport)).to eq subject
    end
  end
  
end