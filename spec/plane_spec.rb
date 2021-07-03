require 'plane'
require 'airport'

describe Plane do
  it { is_expected.to respond_to(:land).with(1).argument }

  it { is_expected.to respond_to(:take_off).with(1).argument }

  it { is_expected.to respond_to(:location) }

  let(:plane1) { Plane.new }
  let(:plane2) { Plane.new }
  let(:plane3) { Plane.new }
  let(:airport) { Airport.new }

  describe '#location' do
    it 'is expected to be in the airport when landed' do
      allow(airport).to receive(:weather) { "sunny" }
      plane1.land(airport)
      expect(plane1.location).to eq(airport)
    end

    it 'is expected to be in the sky after take-off' do
      allow(airport).to receive(:weather) { "sunny" }
      plane1.land(airport)
      plane1.take_off(airport)
      expect(plane1.location).not_to eq(airport)
    end
  end

  describe '#land' do
    it "can't land if the airport is full" do
      allow(airport).to receive(:weather) { "sunny" }
      plane1.land(airport)
      plane2.land(airport)
      expect { plane3.land(airport) }.to raise_error "Plane can't land. Airport is full"
    end

    it "can't land when the weather is stormy" do
      allow(airport).to receive(:weather) { "stormy" }
      expect { plane1.land(airport) }.to raise_error "Plane can't land in stormy weather"
    end
  end

  describe '#take_off' do
    it "can't take off when the weather is stormy" do
      allow(airport).to receive(:weather) { "stormy" }
      expect { plane1.take_off(airport) }.to raise_error "Plane can't take off in stormy weather"
    end
  end
end
