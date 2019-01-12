require 'weather'

RSpec.describe Weather do
    it { is_expected.to respond_to(:forecast) }
    it { expect(subject.forecast).to match(/sunny|stormy/) }
end
    context 'confirm randomness of weather' do
    before(:each) do
      @test_array = []
      100000.times { @test_array << Weather.new.forecast }
      @times_sunny = @test_array.count('sunny').to_f
      @times_stormy = @test_array.count('stormy').to_f
      @random_test_result = @times_sunny/@times_stormy
    end
    it { expect(@random_test_result).to be_within(0.5).of(9) }
end
