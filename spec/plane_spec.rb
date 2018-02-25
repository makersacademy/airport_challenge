require 'plane'

describe Plane do
  subject(:plane) { described_class.new }
  let(:airport) { double :airport }

  describe '#instruct_take_off' do
    it { is_expected.to respond_to :instruct_take_off }

    it 'raises an error if plane is already flying' do
      expect { plane.instruct_take_off }.to raise_error 'Plane cannot take off. Plane is already flying'
    end
  end

  describe '#instruct_landing' do
    it 'stores airport where plane landed at' do
      plane.instruct_landing(airport)
      expect(plane.airport).to eq airport  
    end

    it 'raises an error if plane has already landed' do
      plane.instruct_landing(airport)
      expect { plane.instruct_landing(airport) }.to raise_error 'Plane cannot land. Plane has already landed'
    end
  end

  describe '#airport' do
    it { is_expected.to respond_to :airport }

    it 'raises an error if plane is already flying' do
      expect { plane.airport }.to raise_error 'Plane cannot be at airport. Plane is already flying'
    end
  end
end
