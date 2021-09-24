describe AirportFullError do
  let(:plane) { double :plane }
  let(:subject) { described_class.new(plane) }

  describe '#message' do
    it 'returns the default message' do
      expect(subject.message).to eq AirportFullError::DEFAULT_MESSAGE
    end

    it 'returns a custom message' do
      subject = described_class.new(plane, "custom")
      expect(subject.message).to eq 'custom'
    end
  end

  describe '#effected_plane' do
    it 'returns plane that caused the error' do
      expect(subject.effected_plane).to eq plane
    end
  end
end
