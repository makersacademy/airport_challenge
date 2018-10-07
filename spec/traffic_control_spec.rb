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
    weather = double('Weather', :weather_conditions => 'sunny')
    @weather = weather.weather_conditions
    expect { 21.times { t_c.landing_request(plane) } }.to raise_error 'airport at capacity'
  end

  it 'stops landing in adverse weather' do
    t_c = TrafficControl.new
    plane = Plane.new
    weather = double('Weather', :weather_conditions => 'stormy')
    expect{ t_c.landing_request(plane) }.to raise_error 'adverse landing conditions'
  end

  it 'stops take-off if airport empty' do
    t_c = TrafficControl.new
    expect { t_c.take_off_request }.to raise_error 'airport is empty'
  end

  it 'checks if the weather is adverse' do
    t_c = TrafficControl.new
    plane = Plane.new
    weather = double('weather', :weather_conditions => 'stormy')
    @weather = weather.weather_conditions
    expect(t_c.weather_check(@weather)).to eq 'take-off denied'
  end

  it 'checks if airport is empty' do
    t_c = TrafficControl.new
    expect(t_c.empty?).to eq true
  end

  it 'checks if airport is full' do
    t_c =TrafficControl.new
    plane = Plane.new
    weather = double('Weather', :weather_conditions => 'sunny')
    p @weather = weather.weather_conditions
    20.times { t_c.landing_request(plane) }
    expect(t_c.full?).to eq true
  end
end
