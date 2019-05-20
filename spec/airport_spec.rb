require 'airport.rb'
require 'airplane.rb'
require 'weather.rb'

describe Airport do
  let(:airport) {Airport.new}
  let(:airplane) {Airplane.new}
  let(:weather_stormy) {instance_double('Weather', :stormy? => true, :stormy => true)}
  let(:weather_clear) {instance_double('Weather', :stormy? => false, :stormy => false)}
  it 'can instruct plane to take off' do
    airport.planes << airplane 
    airport.instruct_take_off(weather_clear)
    expect(airplane.flying).to eq true
  end

  it 'can remove airplane from list of airplanes' do 
    airport.planes << airplane
    airport.instruct_take_off(weather_clear)
    expect(airport.planes.count).to eq 0
  end

  #TODO: get around the issue of the return of the method
  # it 'can return the plane that has taken off' do 
  #   airport.planes << airplane
  #   puts airplane
  #   expect(airport.instruct_take_off).to eq airplane
  # end

  it 'can instruct airplane to land' do
    airport.instruct_landing(airplane, weather_clear)
    expect(airport.planes).to eq([airplane])
  end

  it 'can change the plane status of flying to false when the plane lands' do 
    airplane.fly
    airport.instruct_landing(airplane, weather_clear)
    expect(airplane.flying).to eq false
  end

  it 'can prevent take off when weather is stormy' do 
    airport.planes << airplane
    expect{airport.instruct_take_off(weather_stormy)}.to raise_error "Stormy weather, take off denied"
  end

  it 'can prevent landing if weather is stormy' do
    expect{airport.instruct_landing(airplane, weather_stormy)}.to raise_error "Stormy weather, landing denied"
  end

  it 'can prevent landing when capacity is full' do
    10.times do 
      airport.planes << airplane
    end
    expect{airport.instruct_landing(airplane, weather_clear)}.to raise_error "The airport is full, landing denied"
  end

  it 'can override default capacity' do
    airport = Airport.new(30)
    expect(airport.capacity).to eq 30
  end
end
