require 'plane'

describe Plane do
  #let(:plane) {described_class.new}

  describe '#landed?' do
    it 'by default plane is in air' do
      expect(subject).not_to be_landed
    end

  end

end
