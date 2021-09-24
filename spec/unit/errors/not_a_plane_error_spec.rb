require 'errors/not_a_plane_error'
require 'domain/aeroplane'

describe NotAPlaneError do
  thing = "not a plane"
  let(:subject) { described_class.new(thing) }

  describe '#message' do
    it 'returns the default message' do
      expect(subject.message).to eq NotAPlaneError::DEFAULT_MESSAGE
    end
  end

  describe '#effected_object' do
    it 'returns the object type that caused the error' do
      expect(subject.object_passed).to eq String
    end
  end
end
