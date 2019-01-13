require 'weather'

RSpec.describe Weather do
  context 'initial tests' do
    let(:weather_class) { Class.new { extend Weather } }
    subject { weather_class }
    it { is_expected.to respond_to(:stormy_weather?) }
    it { expect(subject.stormy_weather?).to be_truthy.or be nil }
  end

  context 'confirm randomness of weather' do
    let(:weather_class) { Class.new { extend Weather } }
    let(:test_array) { Array.new }
    let(:result) { test_array.count(nil).to_f / test_array.count(true).to_f }
    before(:each) do
      100_000.times { test_array << weather_class.stormy_weather? }
    end
    it { expect(result).to be_within(0.5).of(9) }
  end
end
