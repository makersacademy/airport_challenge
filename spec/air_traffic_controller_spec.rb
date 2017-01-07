require 'airport'

describe AirTrafficController do
  it 'is able to see a plane' do
    Airport.new
    plane = Plane.new
    atc = AirTrafficController.new(plane)
    expect(atc.plane_to_instruct).to eq plane
  end
  it 'instructs planes to land at an airport' do
    expect(subject).to respond_to :instruct_to_land
    plane = Plane.new
    atc = AirTrafficController.new(plane)
    atc.instruct_to_land
    expect(plane).to be_clear_to_land
  end
  it 'confirms when a plane has landed' do
    airport = Airport.new
    plane = Plane.new
    atc = AirTrafficController.new(plane)
    atc.instruct_to_land
    plane.land(airport)
    expect(plane).to be_landed
    expect(airport.planes.include?(plane)).to eq true
  end
  it 'instructs planes to take off from an airport' do
    expect(subject).to respond_to :instruct_to_take_off
    Airport.new
    plane = Plane.new
    atc = AirTrafficController.new(plane)
    atc.instruct_to_take_off
    expect(plane).to be_clear_for_take_off
  end
  it 'confirms that a plane is no longer in the airport' do
    airport = Airport.new
    plane = Plane.new
    atc = AirTrafficController.new(plane)
    atc.instruct_to_land
    plane.land(airport)
    atc.instruct_to_take_off
    plane.take_off(airport)
    expect(plane).to be_taken_off
    expect(airport.planes.include?(plane)).to eq false
  end
  it 'can view the weather condition' do
    expect(subject).to respond_to :check_weather
    expect(Weather::WEATHER_CONDITIONS.include?(subject.check_weather)).to eq true
  end
  it 'prevents take off when weather is stormy' do
    expect {
      until subject.weather == "Stormy" do
        subject.check_weather
      end
      subject.instruct_to_land
           }.to raise_error "Landing not permitted in stormy weather"
  end
  it 'prevents take off when weather is stormy' do
    expect {
      until subject.weather == "Stormy" do
        subject.check_weather
      end
      subject.instruct_to_take_off
           }.to raise_error "Landing not permitted in stormy weather"
  end

end
