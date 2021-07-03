require 'plane'
require 'airport'

describe Plane do
  it { is_expected.to respond_to(:land).with(1).argument }

  it { is_expected.to respond_to(:take_off).with(1).argument }

  it { is_expected.to respond_to(:location) }

  describe 'location' do
    it 'is expected to be in the airport when landed' do
      plane = Plane.new
      airport = Airport.new
      allow(airport).to receive(:weather) { "sunny" }
      plane.land(airport)
      expect(plane.location).to eq(airport)
    end

    it 'is expected to be in the sky after take-off' do
      plane = Plane.new
      airport = Airport.new
      allow(airport).to receive(:weather) { "sunny" }
      plane.land(airport)
      plane.take_off(airport)
      expect(plane.location).not_to eq(airport)
    end

    it "can't land if the airport is full" do
      plane1 = Plane.new
      plane2 = Plane.new
      plane3 = Plane.new
      airport = Airport.new
      allow(airport).to receive(:weather) { "sunny" }
      plane1.land(airport)
      plane2.land(airport)
      expect { plane3.land(airport) }.to raise_error "Plane can't land. Airport is full"
    end

    it "can't take off when the weather is stormy" do
      plane = Plane.new
      airport = Airport.new
      allow(airport).to receive(:weather) { "stormy" }
      expect { plane.take_off(airport) }.to raise_error "Plane can't take off in stormy weather"
    end

    it "can't land when the weather is stormy" do
      plane = Plane.new
      airport = Airport.new
      allow(airport).to receive(:weather) { "stormy" }
      expect { plane.land(airport) }.to raise_error "Plane can't land in stormy weather"
    end
  end
end
