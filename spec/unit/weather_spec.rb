require 'weather'

RSpec.describe Weather do
  let(:weather) { Class.new { extend Weather } }

  it { expect(weather.stormy?).to be_truthy.or be nil }

  context 'confirm randomness of weather' do
    # Run weather generation a statisticalluy significant number of times
    # It is sunny 90% of the time so the result of the test should always be close to 9
    let(:arr) { Array.new }
    let(:result) { arr.count(nil).to_f / arr.count(true) }
    before(:each) do
      100_000.times { arr << weather.stormy? }
    end
    it { expect(result).to be_within(0.5).of(9) }
  end
end
