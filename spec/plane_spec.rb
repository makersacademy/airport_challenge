require 'plane'

describe Plane, :plane do

  describe '#flying?' do
    it { is_expected.to respond_to(:flying?) }

    it 'is flying when initialized' do
      expect(subject).to be_flying
    end
  end

  describe '#land' do
    it { is_expected.to respond_to(:land) }

    it 'is expected not to be #flying after landing' do
      subject.land
      expect(subject).not_to be_flying
    end

    it 'is expected to raise error if not flying' do
      subject.land
      expect { subject.land }. to raise_error 'Plane already landed'
    end
  end

  describe '#take_off' do
    it { is_expected.to respond_to(:take_off) }

    it 'is flying after #take_off' do
      subject.land
      subject.take_off
      expect(subject).to be_flying
    end
  end
end

# test
