require 'plane'

describe Plane do

  subject(:plane) { Plane.new }

  describe '#land' do
    it 'lands in airport when instructed by air traffic controller' do
      plane.land
      expect(plane.landed).to eq true
    end

    it 'raises an error when plane tries to lands if already landed' do
      plane.land
      expect { plane.land
      }.to raise_error "Plane is already landed in an airport!"
    end
  end

  describe '#take_off' do

    it 'raises an error when plane tries to take off if already in air' do
      expect { plane.take_off
      }.to raise_error "Plane is already in air!"
    end
    it 'takes off from airport when instructed by air traffic controller' do
      plane.land
      plane.take_off
      expect(plane.landed).to eq false
    end
  end

end
