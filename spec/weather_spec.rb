require 'weather'

describe Weather do
  subject(:weather) { Weather.new }

  it "knows if the weather is stormy" do
    expect(weather.stormy?).to eq false
  end

  it "knows when a storm is coming" do
    weather.incoming_storm
    expect(weather.stormy?).to eq true
  end

end
