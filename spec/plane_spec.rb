require 'plane'

describe Plane do

  subject(:plane) { described_class.new }

  describe '#not_flying'do

    it 'changes flying_status to false' do
      plane.flying
      plane.not_flying
      expect(plane.flying_status).to be false
    end

    it 'is unable to land if not flying' do
      plane.flying
      plane.not_flying
      expect { plane.not_flying }.to raise_error 'Plane is not flying'
    end
  end

  describe 'flying' do

    it 'changes flying_status to true' do
      plane.flying
      expect(plane.flying_status).to be true
    end

    it 'is unable to fly if already flying' do
      plane.flying
      expect { plane.flying}.to raise_error 'Plane is already flying'
    end
  end
end
