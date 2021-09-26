require 'errors/airport_full_error'
require 'domain/aeroplane'

describe AirportFullError do
  describe '#message' do
    it 'returns the default message' do
      expect(subject.message).to eq AirportFullError::DEFAULT_MESSAGE
    end

    it 'returns a custom message' do
      subject = described_class.new("custom")
      expect(subject.message).to eq 'custom'
    end
  end
end
