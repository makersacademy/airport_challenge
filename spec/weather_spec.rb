require 'weather'

describe Weather do
  subject(:weather) {described_class.new}
  it { is_expected.to respond_to(:stormy?) }

  it "should return true or false" do
    today_weather = weather.stormy?
    expect([true, false].include? today_weather).to eq true
  end

end
