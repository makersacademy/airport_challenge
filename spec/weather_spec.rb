require 'weather'

describe Weather do
  subject(:weather) {described_class.new}

  it "has a randomiser which returns a boolean" do
    expect([true, false]).to include weather.stormy_weather
  end

  it {is_expected.to respond_to :stormy_weather}

end
