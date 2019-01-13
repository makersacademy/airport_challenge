require 'weather'
include Weather

RSpec.describe Weather do
  it { is_expected.to respond_to(:stormy_weather?) }
  it { expect(subject.stormy_weather?).to be_true.or be nil }

  context 'confirm randomness of weather' do
    before(:each) do
      @test_array = []
      100_000.times { @test_array << Weather.stormy_weather? }
      @times_sunny = @test_array.count(nil).to_f
      @times_stormy = @test_array.count(true).to_f
      @random_test_result = @times_sunny / @times_stormy
    end
    it { expect(@random_test_result).to be_within(0.5).of(9) }
  end
end
