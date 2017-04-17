require './lib/weather.rb'

describe Weather do
  subject(:weather) { described_class.new }
  it { is_expected.to respond_to :stormy }

  it "Tests weather generation" do
      expect(weather.stormy).to be(true).or be(false)
    end


end
