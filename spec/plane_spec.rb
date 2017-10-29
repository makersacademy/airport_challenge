require 'plane'

describe Plane do

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
      expect(subject.grounded?).to be(true)
      subject.take_off
      expect(subject.grounded?).to be(false)
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
