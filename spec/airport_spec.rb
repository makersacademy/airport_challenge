require 'airport'

describe Airport do
  let(:weather_report) {double :WeatherReport}
  plane = Plane.new
  #let(:plane) {double :Plane}
  it { is_expected.to respond_to :safe_conditions?}
  it { is_expected.to respond_to :land_plane }
  it { is_expected.to respond_to :plane_depart }
  it { is_expected.to respond_to :clear? }

  it 'Land plane receives a plane'do
    subject.land_plane(plane)
  end

  it "returns true when input is yes" do
    allow(subject).to receive(:gets).and_return("yes")
    expect(subject.clear?).to be(true)
  end

  it "returns false when input is no" do
    allow(subject).to receive(:gets).and_return("no")
    expect(subject.clear?).to be(false)
  end

  it "prevents planes from landing if weather is stormy" do
    allow(weather_report).to receive(:weather_conditions) { "stormy" }
    expect(subject.safe_conditions?(weather_report.weather_conditions)).to eq("stormy")
    expect {subject.land_plane(plane)}.to raise_error 'Unable to land due to stormy conditions'
  end

  it "gets a confirmation from the plane when landed" do
    allow(weather_report).to receive(:weather_conditions) { "clear"}
    expect(subject.safe_conditions?(weather_report.weather_conditions)).to eq("clear")
    expect(subject.land_plane(plane)).to be(true)
  end

  it "prevents planes from departing if weather is stormy" do
    allow(weather_report).to receive(:weather_conditions) { "stormy" }
    expect(subject.safe_conditions?(weather_report.weather_conditions)).to eq("stormy")
    expect {subject.plane_depart}.to raise_error 'Unable to depart due to stormy conditions'
  end

  it "gets a confirmation from the plane when departed" do
    allow(weather_report).to receive(:weather_conditions) { "clear"}
    expect(subject.safe_conditions?(weather_report.weather_conditions)).to eq("clear")
    subject.land_plane(plane)
    expect(subject.plane_depart).to be(true)
  end




#it "ensures the plane lands in clear weather" do
#allow(weather_report).to receive(:weather_conditions) { "clear" }
#expect(subject.landed?).to be(true)
#end

end
