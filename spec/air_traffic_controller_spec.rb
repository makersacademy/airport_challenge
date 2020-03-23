require 'air_traffic_controller'

describe AirTrafficController do
  let(:set_weather_to_clear) { allow(Weather).to receive(:now).and_return(Weather::CLEAR) }
  let(:set_weather_to_stormy) { allow(Weather).to receive(:now).and_return(Weather::STORMY) }

  it 'can tell multiple planes to take off and land' do
    expect(subject).to respond_to(:direct_planes).with(1).argument
  end

  it 'will report when all planes were successfully directed' do
    set_weather_to_clear
    airport = Airport.new
    plane_1 = Plane.new
    plane_1.land(airport)
    plane_2 = Plane.new
    plane_2.land(airport)
    plane_4 = Plane.new
    directions = [[plane_1, nil], [plane_4, airport], [plane_2, nil]]
    expect(subject.direct_planes(directions)).to eq('All planes successfully directed')
  end

  it 'will report when no planes were successfully directed, giving you the reason why' do
    set_weather_to_clear
    airport = Airport.new
    plane_1 = Plane.new
    plane_1.land(airport)
    plane_2 = Plane.new
    plane_2.land(airport)
    plane_4 = Plane.new
    set_weather_to_stormy
    directions = [[plane_1, nil], [plane_4, airport], [plane_2, nil]]
    expect(subject.direct_planes(directions)).to eq('No planes were successfully directed. Plane 1 failed - Unable to take off, stormy weather')
  end

  it 'will report when some planes were successfully directed, giving you the reason why' do
    set_weather_to_clear
    airport = Airport.new
    plane_1 = Plane.new
    plane_1.land(airport)
    plane_2 = Plane.new
    plane_2.land(airport)
    plane_4 = Plane.new
    directions = [[plane_1, nil], [plane_4, airport], [plane_2, airport]]
    expect(subject.direct_planes(directions)).to eq('2 planes were successfully directed. Plane 3 failed - Unable to land, plane has already landed')
  end

  it 'will report when one planes were successfully directed, giving you the reason why' do
    set_weather_to_clear
    airport = Airport.new
    plane_1 = Plane.new
    plane_1.land(airport)
    plane_2 = Plane.new
    plane_2.land(airport)
    plane_4 = Plane.new
    directions = [[plane_1, nil], [plane_4, nil], [plane_2, airport]]
    expect(subject.direct_planes(directions)).to eq('1 plane was successfully directed. Plane 2 failed - Unable to take off, plane is not landed')
  end
end