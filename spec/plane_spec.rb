require 'plane'

describe Plane do
  subject(:plane) { described_class.new }

  context 'when instructed to land' do
    it 'can land and confirm that it has landed' do
      expect(plane.land).to be true
    end
    it 'cannot land if it has already landed' do
      plane.land
      expect { plane.land }.to raise_error('This plane has already landed!')
    end
  end

  context 'when instructed to take off' do
    it 'can take off and confirm that it has not landed' do
      plane.land
      expect(plane.take_off).to be false
    end
    it 'cannot take off if it is already airborne' do
      expect { plane.take_off }.to raise_error('This plane is no longer in the airport!')
    end
  end

end
