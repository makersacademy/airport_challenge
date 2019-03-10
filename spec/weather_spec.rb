require 'weather'

RSpec.describe Weather do

  it { is_expected.to respond_to(:random_weather) }

  it "returns the random weather" do
    random_weather = subject.status
    expect(subject.status).to eq random_weather
  end

end
