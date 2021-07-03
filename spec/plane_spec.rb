require 'plane'

describe Plane do
  it { is_expected.to respond_to(:land).with(1).argument }

  it { is_expected.to respond_to(:take_off).with(1).argument }

  it { is_expected.to respond_to(:location) }

  describe 'location' do
    it 'is expected to be in the airport when landed' do
      plane = Plane.new
      plane.land("airport1")
      expect(plane.location).to eq("airport1")
    end

    it 'is expected to be in the sky after take-off' do
      plane = Plane.new
      plane.land("airport1")
      plane.take_off("airport1")
      expect(plane.location).not_to eq("airport1")
    end

  end
  

end