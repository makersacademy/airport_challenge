require 'plane'

describe Plane do
  let(:weather_report) {double :WeatherReport}
  it {is_expected.to respond_to(:landed?)}
  it {is_expected.to respond_to(:departed?)}

  it "Confirms when landed safely" do
    expect(subject.landed?).to be(true)
  end

  it "Confirms when landed safely" do
    expect(subject.departed?).to be(true)
  end

end
