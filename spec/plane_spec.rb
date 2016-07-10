require 'plane'

describe Plane do
  let(:weather_report) {double :WeatherReport}
  it {is_expected.to respond_to(:landed?)}
  #it {is_expected.to respond_to(:safe_to_land?)}

  it "Confirms when landed safely" do
    expect(subject.landed?).to be(true)
  end
  #it "checks the weather report" do
    #weather_report = double(:weather_conditions => "clear")
    #allow(weather_report).to receive(:weather_conditions) { "stormy" }
    #expect(subject.safe_to_land?(weather_report.weather_conditions)).to eq(false)
    #expect{subject.safe_to_land?(weather_report.weather_conditions)}.to raise_error "Unable to land due to stormy conditions"
  #end

  #it "ensures the plane lands in clear weather" do
  #allow(weather_report).to receive(:weather_conditions) { "clear" }
  #expect(subject.landed?).to be(true)
  #end
end
