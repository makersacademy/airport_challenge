require 'plane'

RSpec.describe Plane do
  describe '#flying?' do
    it 'returns true for a flying plane' do
      expect(subject.flying?).to be true
    end
    it 'returns false for a landed plane' do
      subject.land()
      expect(subject.flying?).to be false
    end
  end
  describe '#land' do
    it 'lands the plane, when it was flying before' do
      subject.land()
      expect(subject.flying?()).to be false
    end
    it 'throws an error, when it was already landed' do
      subject.land()
      expect { subject.land() }.to raise_error('I am already landed!')
    end
  end
    describe '#take_off' do
      it 'lets the plane fly when it was landed before' do
        subject.land()
        subject.take_off()
        expect(subject.flying?).to be true
      end
      it 'throws an error, when it was already flying' do
        expect { subject.take_off() }.to raise_error('I am flying already!')
      end
    end 

end
