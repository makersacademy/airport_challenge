require 'plane'

describe Plane do

  describe 'attributes:' do
    it { is_expected.to have_attributes(landed: true) }
  end

  describe 'responds to:' do
    it 'responds to land' do
      expect(subject).to respond_to :land
    end

    it 'responds to take off' do
      expect(subject).to respond_to :take_off
    end
  end

    describe '#land' do
      it 'expect plane to be landed' do
        expect(subject.land).to eq true
      end
    end

    describe '#take_off' do
      it 'expect plane to be taken off' do
        expect(subject.take_off).to eq false
      end
    end

end
