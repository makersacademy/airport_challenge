require 'airport'
require 'plane'
require 'weather'

describe Airport do 

let(:airport) { Airport.new }
let(:plane) { Plane.new }
let(:weather) { Weather.new }

  describe '#landing_a_plane' do

    it 'Instruct a plane to land at an airport' do
      weather = instance_double("Weather", :state_of_weather => "sunny")
      airport.landing_plane(plane, weather.state_of_weather)
      expect(airport.airport_store.include?(plane)).to eq(true)
    end

    it 'Prevent plane from landing when weather is stormy' do
      weather = instance_double("Weather", :state_of_weather => "stormy")
      airport.landing_plane(plane, weather.state_of_weather)
      expect(airport.airport_store.include?(plane)).to eq(false)
    end

  end

  describe '#plane_taking_off' do

    it 'Instruct a plane to take off from an airport, and confirm take-off' do
      weather = instance_double("Weather", :state_of_weather => "sunny")
      airport.landing_plane(plane, weather.state_of_weather)
      airport.take_off(plane, weather.state_of_weather)
      expect(airport.airport_store.include?(plane)).to eq(false)
    end

    it 'Prevent takeoff when weather is stormy' do
      airport.landing_plane(plane, weather.state_of_weather)
      weather = instance_double("Weather", :state_of_weather => "stormy")
      airport.take_off(plane, weather.state_of_weather)
      expect(airport.airport_store.include?(plane)).to eq(true)
    end

  end

  describe '#airport full' do

    it 'When no capacity is specified, default airport capacity to value 3' do
      expect(airport.capacity).to eq(3)
    end

    it 'Prevent plane for landing as airport is full' do
      weather = instance_double("Weather", :state_of_weather => "sunny")
      airport.capacity.times{airport.landing_plane(plane, weather.state_of_weather)}
      expect{airport.landing_plane(plane, weather.state_of_weather)}.to raise_error("Airport is full")
    end

  end

end