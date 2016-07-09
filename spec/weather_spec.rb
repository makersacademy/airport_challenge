require 'weather'

describe WeatherReport do
  #let(:weather_report) {double :weathergauge}
  it {is_expected.to respond_to(:weather_conditions)}
  it {is_expected.to respond_to(:weather_gauge)}

  it 'is stormy under certain conditions' do
    #weather_report = double(:weather_gauge => 5)
    expect(subject.weather_conditions).to eq("stormy")
  end

  it 'exects weather gauge to return a fixnum' do
    expect(subject.weather_gauge).to be_between(0,5).inclusive
  end

end
