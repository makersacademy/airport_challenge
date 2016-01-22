require 'plane'

describe Plane do
  it { is_expected.to respond_to(:land).with(1).argument }
  it { is_expected.to respond_to(:landed?)}
  it { is_expected.to respond_to(:takeoff)}


  let(:airport){ double :airport }
  let(:good_weather){double :good_weather}
  let(:bad_weather){double :bad_weather}
  it ' (if weather = sunny) responds to the "landed?" method with "true" after receiving the "land" method'do
    good_weather
    subject.land(airport)
    expect(subject.landed?).to eq true
  end

  it ' (if weather = stormy) responds to the "landed?" method with "false" after receiving the "land" method'do
    bad_weather
    subject.land(airport)
    expect(subject.landed?).to eq false
  end

  it ' (if weather = sunny) responds to the "landed?" method with "false" after receiving the "takeoff" method'do
    good_weather
    subject.takeoff
    expect(subject.landed?).to eq false
  end

  it ' (if weather = stormy) responds to the "landed?" method with "true" after receiving the "takeoff" method'do
  bad_weather
  subject.takeoff
  expect(subject.landed?).to eq true
  end
end
