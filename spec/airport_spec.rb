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
      weather = instance_double("Weather", :state_of_weather => "stormy")
      airport.take_off(plane, weather.state_of_weather)
      expect(airport.airport_store.include?(plane)).to eq(true)
      #  Why is this test expecting false?
      # I have used my weather instance_double as a parameter. Can I call this and the passed tests still account?
    end

  end

    describe '#airport_is_full' do

  end

  describe '#airport full' do

    it 'Airport is full' do
      
    end

  end

end