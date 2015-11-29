require 'plane'

describe Plane do
  describe '#landplane'do
    it { is_expected.to respond_to(:landplane) }

    it 'changes status of flying? to false' do
      subject.landplane
      expect(subject.flying?).to be false
    end

    it 'is unable to land when if not flying' do
      subject.landplane
      expect { subject.landplane }.to raise_error 'Plane is not flying'
    end
  end
end
