require 'weather.rb'

describe Weather do
  subject(:condition) { described_class.new }
  it { is_expected.to respond_to(:stormy) }
  it "should return true for stormy if random_weather is greater than 7" do
    allow(Weather).to receive(:random_weather).and_return(9)
    expect(condition.stormy).to eq true
  end
end
