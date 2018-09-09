require './lib/weather'
require './lib/airport'

describe Weather do
  it "calls rand" do
    expect(subject).to receive(:rand).and_return(123)
    expect(subject.weather_rand).to eq 123
  end
end
