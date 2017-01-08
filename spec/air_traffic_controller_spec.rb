require 'airport'

describe AirTrafficController do
  before(:each) do
    @airport = Airport.new
    @plane = Plane.new(@airport)
  end
  subject { AirTrafficController.new(@plane) }
  it 'is able to see a plane' do
    expect(subject).to respond_to :plane_to_instruct
    expect(subject.plane_to_instruct).to eq @plane
  end
  it 'instructs planes to land at an airport' do
    expect(subject).to respond_to :instruct_to_land
    plane = instance_double("Plane(@airport)", clear_to_land?: true)
    expect(plane).to be_clear_to_land
  end
  it 'confirms when a plane has landed' do
    subject.instruct_to_take_off
    @plane.take_off(@airport)
    subject.instruct_to_land
    @plane.land(@airport)
    expect(@plane).to be_landed
    expect(@airport.planes.include?(@plane)).to eq true
  end
  it 'instructs planes to take off from an airport' do
    expect(subject).to respond_to :instruct_to_take_off
    plane = double("Plane", clear_for_take_off?: "true")
    expect(plane).to be_clear_for_take_off
    subject.instruct_to_take_off
    expect(@plane).to be_clear_for_take_off
  end
  it 'confirms that a plane is no longer in the airport' do
    subject.instruct_to_take_off
    @plane.take_off(@airport)
    subject.instruct_to_land
    @plane.land(@airport)
    subject.instruct_to_take_off
    @plane.take_off(@airport)
    expect(@plane).to be_taken_off
    expect(@airport.planes.include?(@plane)).to eq false
  end
  it 'can view the weather condition' do
    expect(subject).to respond_to :check_weather
    allow(subject).to receive(:check_weather) { "Stormy" }
    expect(Weather::WEATHER_CONDITIONS.include?(subject.check_weather)).to eq true
  end
  it 'prevents take off when weather is stormy' do
    allow(subject).to receive(:instruct_to_land).and_raise("Landing not permitted in stormy weather")
    expect{ subject.instruct_to_land }.to raise_error "Landing not permitted in stormy weather"
    expect {
      until subject.weather == "Stormy" do
        subject.check_weather
      end
      subject.instruct_to_land
          }.to raise_error "Landing not permitted in stormy weather"
  end
  it 'prevents take off when weather is stormy' do
    allow(subject).to receive(:instruct_to_land).and_raise("Takeoff not permitted in stormy weather")
    expect{ subject.instruct_to_land }.to raise_error "Takeoff not permitted in stormy weather"
    expect {
      until subject.weather == "Stormy" do
        subject.check_weather
      end
      subject.instruct_to_take_off
    }.to raise_error "Takeoff not permitted in stormy weather"
  end
end
