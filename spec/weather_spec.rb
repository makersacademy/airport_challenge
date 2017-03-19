require 'weather'

describe Weather do
  describe '#stormy_weather?' do
    it 'has a method that checks the weather' do
      expect(subject).to respond_to(:stormy_weather?)
    end

    it 'returns true or false' do
      expect(subject.stormy_weather?).to eq(true).or eq(false)
    end
  end

end
