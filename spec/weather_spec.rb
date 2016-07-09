require 'weather'

describe WeatherReport do
  #let(:gauge) {double :gauge}
  it {is_expected.to respond_to(:weather_conditions)}
  it {is_expected.to respond_to(:weather_gauge)}

  it 'is stormy under certain conditions' do

    #weather_gauge = double(:weather_gauge => 5)
    allow(subject).to receive(:weather_gauge) { 5 }
    expect(subject.weather_gauge).to eq(5)
    expect(subject.weather_conditions).to eq("stormy")
  end

  it 'exects weather gauge to return a number between 0 and 5' do
    expect(subject.weather_gauge).to be_between(0,5).inclusive
  end

end
