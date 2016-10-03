require 'weather'

describe Weather do

  it { is_expected.to respond_to(:random_weather) }

  it "creates a random weather" do
    expect([true, false]).to include subject.random_weather
  end

end
