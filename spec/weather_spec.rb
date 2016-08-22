require 'weather'

describe Weather do

  it "creates random weather when instantiated" do
    expect([true, false]).to include subject.randomise_weather
  end

end
