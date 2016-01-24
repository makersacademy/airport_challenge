require 'weather'

describe Weather do
  it{is_expected.to respond_to(:is_stormy?)}
  describe '#is_stormy?' do
    it 'shows that the weather is stormy' do
      expect(subject.is_stormy?).to be(true)
    end
  end
end
