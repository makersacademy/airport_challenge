require 'traffic_control'

describe 'TrafficControl' do

  it 'instructs a plane to land' do
    t_c = TrafficControl.new
    expect(t_c).to respond_to(:landing_request)
  end

  it 'allows a plane to take-off' do
    t_c = TrafficControl.new
    expect(t_c).to respond_to(:take_off_request)
  end

  it 'checks weather safety conditions' do
    t_c = TrafficControl.new
    weather = Weather.new
    today = weather.weather_conditions
    expect(t_c.weather_check(today)).to eq("take-off allowed").or eq ("take-off denied")
  end

  it 'cannot land more planes than capacity' do
    t_c = TrafficControl.new
    plane = Plane.new
    expect { 21.times { t_c.landing_request(plane) } }.to raise_error
  end

  it 'stops traffic in adverse weather' do

  end

  it 'checks if airport is empty' do
    traffic_control = TrafficControl.new
    puts @airport
    expect(subject.empty?).to eq true
  end
end
