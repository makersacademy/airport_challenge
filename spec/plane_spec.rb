require 'plane'
require 'airport'

describe Plane do
  let(:plane) { Plane.new }
  let(:airport) { double :airport, name: 'Heathrow', permission_to_land: '', permission_to_takeoff: 'f' }

  it 'is expected to be flying upon creation' do
    expect(plane.flying).to eq true
  end

  describe "#land" do
    it { is_expected.to respond_to(:land).with(1).argument }

    it "is expected to change flying status to false" do
      plane.land(airport)
      expect(plane.flying).to eq false
    end

    it "confirms it landed safely" do
      expect(plane.land(airport)).to eq "plane landed safely at #{airport.name}"
    end

    it "will not land in bad weather" do
      allow(airport).to receive(:permission_to_land) { raise "unsafe weather conditions" }
      expect { plane.land(airport) }.to raise_error 'unsafe weather conditions'
    end

    it "raises error if plane is already landed" do
      plane.land(airport)
      expect { plane.land(airport) }.to raise_error 'plane already grounded'
    end
  end

  describe "#takeoff" do
    it { is_expected.to respond_to(:takeoff).with(1).argument }

    it "is expected to change flying status to true" do
      plane.land(airport)
      plane.takeoff(airport)
      expect(plane.flying).to eq true
    end

    it "confirms it took off safely" do
      plane.land(airport)
      expect(plane.takeoff(airport)).to eq "plane took off from #{airport.name} safely"
    end

    it "raises error if plane is already flying" do
      expect { plane.takeoff(airport) }.to raise_error 'plane already flying'
    end

    it "will not takeoff in bad weather" do
      plane.land(airport)
      allow(airport).to receive(:permission_to_takeoff) { raise "unsafe weather conditions" }
      expect { plane.takeoff(airport) }.to raise_error 'unsafe weather conditions'
    end
  end
end
