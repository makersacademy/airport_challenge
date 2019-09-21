require 'plane'

describe Plane do
  let(:plane) { Plane.new }
  let(:airport) { double :airport, name: 'Heathrow' }

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

    it "raise error if plane is already landed" do
      plane.land(airport)
      allow(plane).to receive(:flying?) { false }
      expect { plane.land(airport) }.to raise_error 'plane already grounded'
    end
  end
end
