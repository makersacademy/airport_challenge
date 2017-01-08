require 'weather'

describe Weather do
  it "changes the storm probability for the duration of the test to ensure stormy weather" do
    stub_const("Weather::STORM_PROBABILITY", 1)
    expect(Weather::STORM_PROBABILITY).to eq(1)
  end

  it "changes the storm probability for the duration of the test to ensure good weather" do
    stub_const("Weather::STORM_PROBABILITY", 0)
    expect(Weather::STORM_PROBABILITY).to eq(0)
  end
end
