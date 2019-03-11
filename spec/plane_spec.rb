require 'plane.rb'

describe Plane do
  subject(:plane) { described_class.new }

  let(:airport) { double :airport }

  describe '#take_off' do
    it { is_expected.to respond_to :take_off }

    it 'Already flying error' do
      expect { plane.take_off }.to raise_error 'Plane cannot take off; Plane flying already!'
    end
  end

  describe '#land' do
    it { is_expected.to respond_to(:land).with(1).argument }

    it 'Already landed error' do
      plane.land(airport)
      expect { plane.land(airport) }.to raise_error 'Plane cannot fly; Grounded'
    end
  end

  describe '#airport' do
    it { is_expected.to respond_to :airport }

    it 'Already flying error' do
      expect { plane.airport }.to raise_error 'Plane cannot be at airport; Plane flying already!'
    end
  end
end
