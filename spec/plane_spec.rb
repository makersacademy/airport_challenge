require 'plane'

describe Plane do

  context 'when created' do
    it 'has a flying status when created' do
      expect(subject).not_to be_flying
    end

    it 'can take off' do
      subject.take_off
      expect(subject).to be_flying
    end
  end

  context 'when is flying' do
    it 'can land' do
      subject.take_off
      subject.land
      expect(subject).not_to be_flying
    end
  end

end
