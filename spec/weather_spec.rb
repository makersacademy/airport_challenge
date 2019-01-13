require 'weather'

RSpec.describe Weather do
  let(:weather_class) { Class.new { extend Weather } }
  subject { weather_class }
  it { expect(subject.stormy_weather?).to be_truthy.or be nil }

  context 'confirm randomness of weather' do
    # Run weather generation a statisticalluy significant number of times
    # It is sunny 90% of the time so the result of the test should always be close to 9
    let(:test_array) { Array.new }
    let(:result) { test_array.count(nil).to_f / test_array.count(true) }
    before(:each) do
      100_000.times { test_array << weather_class.stormy_weather? }
    end
    it { expect(result).to be_within(0.5).of(9) }
  end
end
