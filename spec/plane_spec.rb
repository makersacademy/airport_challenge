require 'plane'

describe Plane do

  describe '#landed' do
    
    it { is_expected.to respond_to :landed }

    it 'confirms the plane has landed' do
      expect(subject.landed).to eq true
    end
  end

  describe '#taken_off' do

    it { is_expected.to respond_to :taken_off }

    it 'confirms the plane has taken off' do
      expect(subject.taken_off).to eq false
    end
  end
end
