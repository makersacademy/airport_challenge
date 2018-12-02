require 'airport'
require 'airplane'

RSpec.describe Airport do
  let(:airport) { Airport.new }
  let(:airplane) { Airplane.new}

  it { is_expected.to respond_to(:land).with(1).argument }

  it { is_expected.to respond_to(:takeoff) }

  describe '#land' do
    it 'return an array with an airplane' do
      expect(airport.land(airplane)).to eq [airplane]
    end
  end

  describe '#takeoff' do
    it 'return an array without the airplane' do
      expect(airport.takeoff).to eq nil
    end
  end

end
