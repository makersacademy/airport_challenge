require './lib/plane'

describe Plane do
  context 'The plane is not in a hanger' do
    it 'returns false' do
      expect(subject.is_flying).to_not be(true)
    end
  end
end
