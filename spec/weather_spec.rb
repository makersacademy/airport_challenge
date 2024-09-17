require 'weather'

RSpec.describe Weather do
  describe '#bad?' do
    it 'returns a boolean' do
      expect(subject.bad?).to be(true).or be(false)
    end
  end
end
