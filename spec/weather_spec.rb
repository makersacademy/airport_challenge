require 'weather'

describe Weather do
  it {is_expected.to respond_to(:current_weather)}

  describe '#current_weather' do
    it 'should return a boolean representing the weather' do
      subject.current_weather
      expect(subject.stormy).to be_truthy
    end
  end
end
