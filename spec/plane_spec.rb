require 'plane'

describe Plane do
  subject(:plane) { described_class.new }

  describe '#instruct_take_off' do
    it { is_expected.to respond_to :instruct_take_off }
    it 'produces an error if flying already' do
      expect { plane.instruct_take_off }.to raise_error 'Plane cannot take off, plane is flying already'
    end
  end
end
