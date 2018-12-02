require 'weather'

RSpec.describe Weather do

  it { is_expected.to respond_to(:random_weather) }

  it { is_expected.to respond_to(:weather_condition) }

  describe '#random_weather' do
    it 'return 1 or 2' do
      expect(subject.random_weather).to be_between(1, 2)
    end
  end

  describe '#weather_condition' do
    it 'return true or false' do
      expect(subject.random_weather).to be(1).or be(2)
    end
  end

end
