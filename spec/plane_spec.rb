require 'plane'

describe Plane do

  subject(:plane) { described_class.new }

  it 'is expected to initialize already flying' do
    expect { plane.took_off }.to raise_error "This plane is already flying"
  end

  describe '#landed' do

    it 'is expected to raise an error if already landed' do
      plane.landed
      expect { plane.landed }.to raise_error "This plane is already landed"
    end
  end

  describe '#took_off' do

    it 'is expected to raise an error if already flying' do
      plane.landed
      plane.took_off
      expect { plane.took_off }.to raise_error "This plane is already flying"
    end
  end
end
