require 'errors/not_an_airport_error'

describe NotAnAirportError do
  thing = "not an airport"
  let(:subject) { described_class.new(thing) }

  describe '#message' do
    it 'returns the default message' do
      expect(subject.message).to eq NotAnAirportError::DEFAULT_MESSAGE
    end
  end

  describe '#effected_object' do
    it 'returns the object type that caused the error' do
      expect(subject.object_passed).to eq String
    end
  end
end
