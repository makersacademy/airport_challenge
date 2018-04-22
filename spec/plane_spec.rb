require 'plane'

describe Plane, :plane do
  describe '#flying?' do
    it 'is flying when initialised' do
      expect(subject).to be_flying
    end
  end

  describe '#land' do
    it 'plane expected to be landed and not flying' do
      subject.land
      expect(subject).not_to be_flying
    end

    it 'will raise error if not flying' do
      subject.land
      expect { subject.land }.to raise_error 'Plane has already landed'
    end
  end

  describe '#takeoff' do
    it 'flying is true after take off' do
      subject.land
      subject.takeoff
      expect(subject).to be_flying
    end

    it 'will raise error if that plane is already flying' do
      expect { subject.take_off }.to raise_error 'Plane is already in the air'
    end
  end
end
