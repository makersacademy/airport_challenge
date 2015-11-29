require 'plane'

describe Plane do

  let(:airport) {double(:airport,
                :name => "JFK",
                :bad_weather? => false,
                :planes => [],
                :full? => false)}

  it 'returns false if plane has already landed into an airport' do
    air_control = AirTrafficControl.new
    air_control.land(subject, airport)
    expect(subject.is_flying).to eq false
  end

  it 'returns true if plane is flying' do
    air_control = AirTrafficControl.new
    air_control.land(subject, airport)
    air_control.take_off(subject, airport)
    expect(subject.is_flying).to eq true
  end

end
