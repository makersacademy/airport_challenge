require 'plane'

describe Plane do
  let(:weather_report) {double :weather_report}
  it {is_expected.to respond_to(:landed?)}
  it {is_expected.to respond_to(:safe_to_land?)}

  it "ensures the plane lands in clear weather" do
  #allow(subject).to receive(:landed?) { true }
  #allow(weather_report).to receive(weather_conditions) { "clear" }
  #expect(subject.landed?).to eq("landed safely")
  end
end
