require 'plane'

describe Plane do
  subject(:plane) { described_class.new }

  describe '#instruct_take_off' do
    it { is_expected.to respond_to :instruct_take_off }
    it 'raises an error if plane is already flying' do
      expect { plane.instruct_take_off }.to raise_error 'Plane cannot take off. Plane is already flying'
    end
  end

  describe '#airport' do
    it { is_expected.to respond_to :airport }

    it 'raises an error if plane is already flying' do
      expect { plane.airport }.to raise_error 'Plane cannot be at airport. Plane is already flying'
    end
  end

end
