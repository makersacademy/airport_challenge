require 'plane'

describe Plane do

  let(:airport) { instance_double("Airport") }
  let(:plane) { Plane.new }

  describe '#initialize' do

    it 'is initiailised to be flying' do
      expect(plane.flying?).to eq true
    end

    it 'has a location of in-flight' do
      expect(plane.location?).to eq "In-flight"
    end
  end

  describe '#land' do

    it 'lands the plane' do
      plane.land(airport)
      expect(plane.flying?).to eq false
    end

    it 'sets location to the controlling airport' do
      plane.land(airport)
      expect(plane.location?).to eq airport
    end

  end

  describe '#take_off' do

    before { plane.land(airport) }

    it "takes off" do
      plane.take_off
      expect(plane.flying?).to eq true
    end

    it 'sets location to In-flight' do
      plane.take_off
      expect(plane.location?).to eq "In-flight"
    end
  end

end
