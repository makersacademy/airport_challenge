require 'weather'

describe WeatherStation do
  let(:fake_number) { double(:number) }
  subject(:station) { WeatherStation.new(fake_number) }

  it "reports sunny weather" do
    allow(fake_number).to receive(:rand).and_return(2)
    expect(station.todays_weather()).to eq :sunny
  end

  it "reports stormy weather" do
    allow(fake_number).to receive(:rand).and_return(4)
    expect(station.todays_weather()).to eq :stormy
  end

end
