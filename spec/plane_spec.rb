require 'plane'

describe Plane do
  subject(:plane) { described_class.new }

  context 'when initialized' do
    it 'should have an airborne status' do
      expect(plane.status).to eq :airborne
    end
  end

  context 'when instructed to land' do
    before { plane.land }
    it 'can land and confirm that it has landed' do
      expect(plane.status).to eq :landed
    end
    it 'cannot land if it has already landed' do
      expect { plane.land }.to raise_error('This plane has already landed!')
    end
  end

  context 'when instructed to take off' do
    before do
      plane.land
      plane.take_off
    end
    it 'can take off and confirm that it is airborne' do
      expect(plane.status).to eq :airborne
    end
    it 'cannot take off if it is already airborne' do
      expect { plane.take_off }.to raise_error('This plane is no longer in the airport!')
    end
  end

end
