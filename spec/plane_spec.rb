require 'airport'
require 'plane'
# require 'pry'
describe Plane do
  subject(:plane) { described_class.new }

  describe '#take_off' do
    it  {is_expected.to respond_to :take_off}

    it 'raises an error if already flying' do
      expect { plane.take_off }.to raise_error 'Plane already flying, cannot take off'
    end
  end

  describe '#airport' do
    it  {is_expected.to respond_to :airport}

    it 'raises an error if already flying' do
       expect { plane.airport }.to raise_error 'Plane already flaying cannot be at the airport'
    end
  end
end
