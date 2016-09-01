require 'weather'

describe Weather do
  subject(:weather) { described_class.new }

  context 'responses' do
    it { is_expected.to respond_to(:current_weather) }
  end

  context '#initialize' do
    it 'generates a random number' do
      expect(weather.number).to be_a(Float)
    end
  end

  context ':current_weather' do
    it "generates a weather type succesfully" do
      expect{weather.current_weather}.not_to raise_error
    end
    it "informs us of the current weather" do
      expect(weather.current_weather).to be_a(Symbol)
    end
  end

end
