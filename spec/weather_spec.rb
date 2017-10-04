require 'weather'

describe Weather do
  it "::WEATHER_STATE returns a array" do
    expect(Weather::WEATHER_STATE).to be_instance_of Array
  end

  it "#report returns a random weather state" do
    count = 0
    10.times { count += 1 if Weather.report == Weather.report }
    expect(count).to be < 5
  end
end
