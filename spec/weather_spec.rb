require 'weather'

RSpec.describe Weather do
  let(:weather_class) { Class.new { extend Weather } }
  subject { weather_class }
  it { expect(subject.stormy_weather?).to be_truthy.or be nil }

  context 'confirm randomness of weather' do
    let(:test_array) { Array.new }
    let(:result) { test_array.count(nil).to_f / test_array.count(true).to_f }
    before(:each) do
      100_000.times { test_array << weather_class.stormy_weather? }
    end
    it { expect(result).to be_within(0.5).of(9) }
  end
end
