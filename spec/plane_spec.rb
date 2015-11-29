require 'plane'

describe Plane do

  subject(:plane) { described_class.new }

  it 'is expected to initialize already flying' do
    expect { plane.take_off }.to raise_error "This plane is already flying"
  end

  describe '#land' do

    it 'is expected to raise an error if already landed' do
      plane.land
      expect { plane.land }.to raise_error "This plane is already landed"
    end
  end

  describe '#take_off' do

    it 'is expected to raise an error if already flying' do
      plane.land
      plane.take_off
      expect { plane.take_off }.to raise_error "This plane is already flying"
    end
  end
end
