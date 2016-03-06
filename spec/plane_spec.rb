require 'plane'

describe Plane do
  let(:airport) { double(:Airport) }

  describe '#land' do
    it { is_expected.to respond_to(:land).with(1).argument}

    it 'lands only when flying' do
      subject.land airport
      expect{subject.land airport}.to raise_error "Already landed!"
    end
  end

  describe '#landed?' do
    it { is_expected.to respond_to(:landed?) }

    it 'displays that it has landed when at an airport' do
      subject.land airport
      expect(subject).to be_landed
    end
  end

  describe '#take_off' do
    it { is_expected.to respond_to(:take_off).with(1).argument }

    it 'leaves only when commanded by relevant airport' do
      subject.land airport
      expect{subject.take_off 'somewhere_else'}.to raise_error "Wrong airport giving instructions"
    end

    it 'is no longer at an airport' do
      subject.land airport
      subject.take_off airport
      expect(subject).not_to be_landed
    end
  end
end
