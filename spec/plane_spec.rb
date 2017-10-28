require 'plane'

describe Plane do

  # let(:airport) { double(:airport) }
  #
  # describe 'check airport double' do
  #   it { p airport }
  # end

  describe '@status' do
    it "returns 'grounded' or 'flying'" do
      expect(subject.status).to eq('grounded').or eq('flying')
    end
  end

  describe '#grounded?' do
    it { expect(subject.grounded?).to be(true).or be(false) }

    it 'returns opposite of flying?' do
      expect(subject.grounded?).not_to be(subject.flying?)
    end

    it 'returns true or false depending on status' do
      if subject.status == 'grounded'
        expect(subject.grounded?).to be(true)
      else
        expect(subject.flying?).to be(true)
      end
    end
  end

  describe '#flying?' do
    it { expect(subject.flying?).to be(true).or be(false) }

    it 'returns opposite of grounded?' do
      expect(subject.flying?).not_to be(subject.grounded?)
    end
  end

  describe '#land' do
    it 'changes planes status to landed' do
      subject.take_off
      expect{ subject.land }.to change { subject.status }
    end
  end

  describe '#take_off' do
    it { expect{ subject.take_off }.to change { subject.status } }
  end

end
