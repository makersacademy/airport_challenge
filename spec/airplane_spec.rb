require 'airplane'

describe Airplane do

  subject(:airplane) {Airplane.new}

  describe '#landed?' do
    it { is_expected.to respond_to :landed? }
  end

  describe '#taken_off' do
    it { is_expected.to respond_to :taken_off}

    it 'raises an error if already taken off' do
      expect { airplane.taken_off }.to raise_error "Plane has already taken off!"
    end

  end



end
