require "plane"

describe Plane do
  let(:airport) { double :airport }
  before { allow(airport).to receive(:planes).and_return([]) }
  subject(:plane) { described_class.new(airport) }
  let(:weather) { double :weather, stormy?: false }

  it "is in an airport when initialized" do
    expect(subject.flying).to eq false
  end

  describe "#land_at" do
    it "lands in the airport" do
      subject.depart_from(airport)
      subject.land_at(airport)
      expect(subject.flying).to eq false
    end

    it "cannot land again once in the airport" do
      message = "Plane already landed"
      expect { subject.land_at(airport) }.to raise_error
    end
  end

  describe "#depart_from" do
    it "takes off from the airport" do
      subject.depart_from(airport)
      expect(subject.flying).to eq true
    end

    let(:wrong_airport) { double :wrong_airport }
    it "only departs from the airport it is in" do
      message = "Wrong airport"
      expect { subject.depart_from(wrong_airport) }.to raise_error message
    end

    it "cannot take off again once it is flying" do
      subject.depart_from(airport)
      message = "Plane already flying"
      expect { subject.depart_from(airport) }.to raise_error message
    end
  end
end
