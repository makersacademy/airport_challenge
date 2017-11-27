require 'weather.rb'
describe Weather do
  subject(:weather) { described_class.new }
  describe 'stormy' do
    it "should be initialized as false" do
      expect(subject.stormy).to eq false
    end
  end
  describe '#change_weather' do
    it "should sometimes return stormy" do
      srand(2)
      subject.change_weather
      expect(weather.stormy).to eq(true)
    end
    it "should sometimes return not stormy" do
      srand(1)
      subject.change_weather
      expect(weather.stormy).to eq(false)
    end
  end
end
