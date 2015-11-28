require 'plane'

describe Plane do

  let(:airport) {double(:airport,
                :name => "JFK",
                :weather_is_stormy? => false,
                :planes => [],
                :full? => false)}

  it 'returns false if plane has already landed into an airport' do
    air_control = AirTrafficControl.new
    air_control.instruct_landing(subject, airport)
    expect(subject.is_flying).to eq false
  end

  it 'returns true if plane is flying' do
    air_control = AirTrafficControl.new
    air_control.instruct_landing(subject, airport)
    air_control.instruct_takeoff(subject, airport)
    expect(subject.is_flying).to eq true
  end

end
