require 'plane'
require 'airport'

describe Plane do
  let(:plane) { Plane.new }
  let(:airport) { double :airport, name: 'Heathrow', permission_to_land: 'Safe to land' }

  it 'is expected to be flying upon creation' do
    expect(plane.flying).to eq true
  end

  describe "#land" do
    it { is_expected.to respond_to(:land).with(1).argument }

    before { allow(airport).to receive(:permission_to_land).with(plane) }

    it "is expected to change flying status to false" do
      airport2 = airport
      subject.land(airport2)
      expect(subject.flying).to eq false
    end

    it "confirms it landed safely" do
      expect(plane.land(airport)).to eq "plane landed safely at #{airport.name}"
    end

    it "will not land in bad weather" do
      allow(airport).to receive(:permission_to_land) { raise "unsafe weather conditions" }
      expect { plane.land(airport) }.to raise_error 'unsafe weather conditions'
    end

    it "raise error if plane is already landed" do
      plane.land(airport)
      allow(plane).to receive(:flying?) { false }
      expect { plane.land(airport) }.to raise_error 'plane already grounded'
    end
  end

  describe "#takeoff" do
    it { is_expected.to respond_to(:takeoff).with(1).argument }
  end
end
