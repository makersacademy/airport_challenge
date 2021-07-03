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
      plane.land(airport)
      expect(plane.location).to eq(airport)
    end

    it 'is expected to be in the sky after take-off' do
      plane = Plane.new
      airport = Airport.new
      plane.land(airport)
      plane.take_off(airport)
      expect(plane.location).not_to eq(airport)
    end

    it "can't land if the airport is full" do
      plane1 = Plane.new
      plane2 = Plane.new
      plane3 = Plane.new
      airport = Airport.new
      plane1.land(airport)
      plane2.land(airport)
      expect { plane3.land(airport) }.to raise_error "Plane can't land. Airport is full"
    end

  end
  

end