require 'plane'

describe Plane do
  subject = Plane.new("a373")

  describe '#flying?' do
    it 'returns the status' do
      expect(subject.flying?).to eq(false)
    end
  end
end
