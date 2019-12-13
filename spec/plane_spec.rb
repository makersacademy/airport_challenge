require './lib/plane'

describe Plane do
  context 'The plane is not in a hanger' do
    it 'returns false' do
      expect(subject.landed).to_not be(true)
    end
  end
end