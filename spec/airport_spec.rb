require 'airport'

describe Airport do
  let(:weather_report) {double :WeatherReport}
  it { is_expected.to respond_to :land_plane }

  it 'Land plane receives a plane'do
    plane = Plane.new
    subject.land_plane(plane)
  end

  it "checks the weather report result when stormy" do
    #weather_report = double(:weather_conditions => "clear")
    allow(weather_report).to receive(:weather_conditions) { "stormy" }
    expect(subject.safe_conditions?(weather_report.weather_conditions)).to eq(false)
    #expect{subject.safe_to_land?(weather_report.weather_conditions)}.to raise_error "Unable to land due to stormy conditions"
  end

  it "cecks the weather report result when clear" do
    allow(weather_report).to receive(:weather_conditions) { "clear"}
    expect(subject.safe_conditions?(weather_report.weather_conditions)).to eq(true)
  end



#it "ensures the plane lands in clear weather" do
#allow(weather_report).to receive(:weather_conditions) { "clear" }
#expect(subject.landed?).to be(true)
#end

end
