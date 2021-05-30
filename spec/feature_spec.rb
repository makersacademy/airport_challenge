require './lib/airport.rb'
require './lib/plane.rb'
require 'capybara/rspec'

RSpec.feature 'control the flow of planes at an airport' do
  background do
    given_there_is_an_airport
  end

  scenario 'instructing a plane to land at an airport' do
    given_there_is_a_plane
    with_good_weather
    land_the_plane_at_the_airport
    the_plane_should_appear_in_the_airport
  end

  scenario 'raises an error when trying to land a plane already landed' do
    given_there_is_a_plane_in_the_airport
    landing_the_plane_should_raise_an_error
  end

  scenario 'instructing a plane to take off from an airport and confirm that it is no longer in the airport' do
    given_there_is_a_plane_in_the_airport
    with_good_weather
    instruct_the_plane_to_take_off
    the_plane_should_have_left_the_airport
  end

  scenario 'planes cannot take off once already taken off' do
    given_there_is_a_plane_in_the_airport
    with_good_weather
    instruct_the_plane_to_take_off
    instructing_the_plane_to_take_off_should_raise_an_error
  end

  scenario 'planes not at the airport are unable to take off' do
    given_there_is_a_plane
    instructing_the_plane_to_take_off_should_raise_an_error
  end

  scenario 'preventing landing when the airport is full' do
    repeat_park_planes 20
    given_there_is_a_plane
    landing_the_plane_should_raise_an_error
  end

  scenario 'defaulting airport capacity' do
    the_airport_has_default_capacity
  end

  scenario 'overriding airport capacity' do
    create_a_new_airport_with_capacity 2
    repeat_park_planes 2
    landing_the_plane_should_raise_an_error
  end

  # scenario 'preventing take off when weather is stormy' do

  # end

  # scenario 'preventing landing when weather is stormy' do

  # end
  
  private

  def given_there_is_an_airport
    @heathrow = Airport.new
  end

  def given_there_is_a_plane
    @boeing747 = Plane.new
  end

  def with_good_weather
    allow_any_instance_of(Object).to receive(:rand).and_return(0.9)
  end

  def land_the_plane_at_the_airport
    @heathrow.land(@boeing747)
  end

  def the_plane_should_appear_in_the_airport
    expect(@heathrow.hangar).to include(@boeing747)
  end

  def given_there_is_a_plane_in_the_airport
    given_there_is_a_plane
    with_good_weather
    @heathrow.land(@boeing747)
  end

  def instruct_the_plane_to_take_off
    @heathrow.take_off(@boeing747)
  end

  def the_plane_should_have_left_the_airport
    expect(@heathrow.hangar).not_to include(@boeing747)
  end

  def landing_the_plane_should_raise_an_error
    expect { @heathrow.land(@boeing747) }.to raise_error RuntimeError
  end

  def instructing_the_plane_to_take_off_should_raise_an_error
    expect { @heathrow.take_off(@boeing747) }.to raise_error RuntimeError
  end

  def repeat_park_planes(number)
    with_good_weather
    number.times do
      @heathrow.land(Plane.new)
    end
  end

  def the_airport_has_default_capacity
    expect(@heathrow.capacity).to eq Airport::DEFAULT_CAPACITY
  end

  def create_a_new_airport_with_capacity(number)
    @heathrow = Airport.new(number)
  end
end

=begin
  IRB FEATURE TEST

prevents takeoff when the weather is stormy
loop do
  city_airport.take_off(light_aircraft)
  until city_airport.hangar.length == 1
    begin
      city_airport.land(light_aircraft)
    rescue RuntimeError
      next
    end
  end
end

prevents landing when the weather is stormy
loop do
  until city_airport.hangar.length == 0
    begin
      city_airport.take_off(light_aircraft)
    rescue RuntimeError
      next
    end
  end
  city_airport.land(light_aircraft)
end
=end
