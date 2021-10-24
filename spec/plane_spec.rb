require 'plane.rb'

describe Plane do

  context '#land' do
    it { is_expected.to respond_to(:land) }

    it { is_expected.to respond_to(:land).with(1).argument }

    it 'lands a plane at an airport' do
      plane = Plane.new
      expect(plane.land('airport')).to eq 'airport'
    end
  end

  context '#takeoff' do
    it { is_expected.to respond_to(:takeoff) }

    it { is_expected.to respond_to(:takeoff).with(1).argument }

    it 'takes of from an airport' do
      plane = Plane.new
      expect(plane.takeoff('airport')).to eq 'airport'
    end

  end 

end