require 'plane'

describe Plane do

  subject(:plane) { described_class.new }

  describe '#land' do

    it 'lands at an airport' do
      plane.land
      expect(plane.landed).to eq true
    end

    it "doesn't land unless flying" do
      plane.land
      expect { plane.land }.to raise_error('Plane is on ground!')
    end

  end

  describe '#takeoff' do

    it 'takes off from an aiport if parked' do
      plane.land
      plane.takeoff
      expect(plane.landed).to eq false
    end

    it "doesn't takeoff unless parked" do
      expect { plane.takeoff }.to raise_error('Plane is already flying!')
    end

  end

end
