require './lib/weather'

describe Weather do
subject { Weather.new }

  describe '#stormy' do
    it 'generates true or false, depending on if weather is stormy' do
      subject.stormy?
      expect(subject.stormy?).to be(true).or be(false)
    end
  end
end
