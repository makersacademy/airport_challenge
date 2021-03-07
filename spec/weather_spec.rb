require 'weather'
require 'airport'

describe Weather do
  it "returns a random number" do
    expect(subject).to receive(:rand)
    subject.weather_report
  end
end
