require 'weather'

RSpec.describe Weather do

  it "returns random weather" do
    weather = Weather.new
    random_weather = subject.random_weather
    subject.status = random_weather
    expect(subject.status).to eq random_weather
  end

end