require 'weather'

describe Weather do
  describe '#stormy_weather?' do

    it 'should return true or false' do
      expect(subject.stormy_weather?).to eq(true).or eq(false)
    end
  end

end
