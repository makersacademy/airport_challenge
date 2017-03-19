require 'airplane'

describe Airplane do

  subject(:airplane) {described_class.new}
  let(:airport) {double :airport}

  describe '#landed' do

    it { is_expected.to respond_to :landed }

    it 'stores the airport landed at' do
      airplane.landed(airport)
      expect(airplane.airport).to eq airport
    end

    it 'raises an error if already landed' do
      airplane.landed(airport)
      expect { airplane.landed(airport) }.to raise_error 'Plane has already landed!'
    end

  end

  describe '#taken_off' do
    it { is_expected.to respond_to :taken_off}

    it 'raises an error if already taken off' do
      expect { airplane.taken_off }.to raise_error "Plane has already taken off!"
    end

  end



end
