require 'weather'

describe Weather do
  subject(:weather) { Weather.new }

  it "knows when a storm is coming" do
    weather.incoming_storm
    expect(weather.stormy?).to eq true
  end

  it "says the weather is just fine" do
    weather.all_clear
    expect(weather.stormy?).to eq false
  end

end
