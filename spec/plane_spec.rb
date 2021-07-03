require 'plane'
require 'airport'

describe Plane do
  it { is_expected.to respond_to(:land).with(1).argument }

  it { is_expected.to respond_to(:take_off).with(1).argument }

  it { is_expected.to respond_to(:location) }

  let(:plane1) { Plane.new }
  let(:plane2) { Plane.new }
  let(:plane3) { Plane.new }
  let(:airport1) { Airport.new }
  let(:airport2) { Airport.new }

  describe '#location' do
    it 'is expected to be in the airport when landed' do
      allow(airport1).to receive(:weather) { "sunny" }
      plane1.land(airport1)
      expect(plane1.location).to eq(airport1)
    end

    it 'is expected to be in the sky after take-off' do
      allow(airport1).to receive(:weather) { "sunny" }
      plane1.land(airport1)
      plane1.take_off(airport1)
      expect(plane1.location).not_to eq(airport1)
    end
  end

  describe '#land' do
    it "can't land if the airport is full" do
      allow(airport1).to receive(:weather) { "sunny" }
      plane1.land(airport1)
      plane2.land(airport1)
      expect { plane3.land(airport1) }.to raise_error "Plane can't land. Airport is full"
    end

    it "can't land when the weather is stormy" do
      allow(airport1).to receive(:weather) { "stormy" }
      expect { plane1.land(airport1) }.to raise_error "Plane can't land in stormy weather"
    end
  end

  describe '#take_off' do
    it "can't take off when the weather is stormy" do
      allow(airport1).to receive(:weather) { "stormy" }
      expect { plane1.take_off(airport1) }.to raise_error "Plane can't take off in stormy weather"
    end

    it "can only take off from airports it is in" do
      allow(airport1).to receive(:weather) { "sunny" }
      allow(airport2).to receive(:weather) { "sunny" }
      plane1.land(airport1)
      expect { plane1.take_off(airport2) }.to raise_error "Plane not at this airport"
    end
  end
end
