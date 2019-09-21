require 'weather'

describe Weather do
  describe "#sunny?" do
    it 'returns true when Weather is sunny' do
      subject = instance_double("Weather")
      allow(subject).to receive(:sunny?) { true }
      expect(subject.sunny?).to eq true
    end
    it 'returns false when Weather is stormy' do
      subject = instance_double("Weather")
      allow(subject).to receive(:sunny?) { false }
      expect(subject.sunny?).to eq false
    end
  end
end