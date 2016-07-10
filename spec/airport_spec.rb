require 'airport'

describe Airport do
  let(:weather_report) {double :WeatherReport}
  let(:plane) {double :Plane}
  it { is_expected.to respond_to :safe_conditions?}
  it { is_expected.to respond_to :land_plane }

  it 'Land plane receives a plane'do
    subject.land_plane(plane)
  end

  it "checks the weather report result when stormy" do
    allow(weather_report).to receive(:weather_conditions) { "stormy" }
    expect(subject.safe_conditions?(weather_report.weather_conditions)).to eq("stormy")
  end

  it "cecks the weather report result when clear" do
    allow(weather_report).to receive(:weather_conditions) { "clear"}
    expect(subject.safe_conditions?(weather_report.weather_conditions)).to eq("clear")
  end

  it "prevents planes from landing if weather is stormy" do
    allow(weather_report).to receive(:weather_conditions) { "stormy" }
    expect(subject.safe_conditions?(weather_report.weather_conditions)).to eq("stormy")
    expect {subject.land_plane(plane)}.to raise_error "Unable to land due to stormy conditions"
  end



#it "ensures the plane lands in clear weather" do
#allow(weather_report).to receive(:weather_conditions) { "clear" }
#expect(subject.landed?).to be(true)
#end

end
