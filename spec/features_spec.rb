require 'airport'

describe 'Feature Tests' do
  it 'User can instruct a plane to land at an airport' do
    given_there_is_a_new_airport
    given_there_is_a_new_plane
    assuming_that_the_weather_is_not_stormy
    then_plane_can_land_at_airport
  end

  it 'User can instruct a plane to take off from an airport' do
    given_there_is_a_new_plane
    given_there_is_a_new_airport
    assuming_that_the_weather_is_not_stormy
    given_that_plane_is_in_airport
    then_plane_can_take_off
  end

  it 'User can confirm that after take off plane is not in airport' do
    given_there_is_a_new_plane
    given_there_is_a_new_airport
    assuming_that_the_weather_is_not_stormy
    given_that_plane_is_in_airport
    given_that_plane_has_taken_off
    then_user_can_confirm_plane_not_in_airport
  end

  it 'Stormy weather can prevent plane taking off' do
    given_there_is_a_new_plane
    given_there_is_a_new_airport
    assuming_that_the_weather_is_not_stormy
    given_that_plane_is_in_airport
    assuming_that_the_weather_is_stormy
    then_plane_cannot_take_off
  end

  it 'Stormy weather can prevent plane landing' do
    given_there_is_a_new_plane
    given_there_is_a_new_airport
    assuming_that_the_weather_is_stormy
    then_plane_cannot_land
  end

  it 'A full airport can prevent a plane from landing' do
    given_there_is_a_new_airport # With default capacity
    given_there_is_a_new_plane
    assuming_that_the_weather_is_not_stormy
    given_that_the_airport_is_full
    then_another_plane_cannot_land
  end

  it 'User can create airport with default capacity' do
    given_there_is_a_new_airport
    then_user_can_confirm_default_capacity
  end

  it 'User can create airport with specified capacity' do
    given_there_is_another_airport_with_specified_capacity
    then_user_can_confirm_specified_capacity
  end

  ## Edge Cases ##
  it 'Plane can only take off from airport it is in' do
    given_there_is_a_new_plane
    given_there_is_a_new_airport
    given_there_is_another_airport_with_specified_capacity
    assuming_that_the_weather_is_not_stormy
    given_that_plane_is_in_airport
    then_plane_cannot_take_off_from_another_airport
  end

  it 'Plane already flying cannot take off' do
    given_there_is_a_new_plane
    given_there_is_a_new_airport
    assuming_that_the_weather_is_not_stormy
    then_flying_plane_cannot_take_off
  end

  it 'Plane already flying cannot be in airport' do
    given_there_is_a_new_plane
    given_there_is_a_new_airport
    assuming_that_the_weather_is_not_stormy
    given_that_plane_is_in_airport
    given_that_plane_has_taken_off
    then_plane_is_not_in_airport
  end

  it 'Plane that has landed cannot land again' do
    given_there_is_a_new_plane
    given_there_is_a_new_airport
    assuming_that_the_weather_is_not_stormy
    given_that_plane_is_in_airport
    then_plane_cannot_land_again
  end

  it 'Plane that has landed must be in an airport' do
    given_there_is_a_new_plane
    given_there_is_a_new_airport
    assuming_that_the_weather_is_not_stormy
    given_that_plane_is_in_airport
    then_plane_shows_it_is_in_airport
  end

end

def given_there_is_a_new_airport
  @airport = Airport.new
end

def given_there_is_a_new_plane
  @plane = Plane.new
end

def assuming_that_the_weather_is_stormy
  allow(@airport.weather).to receive(:stormy?) { true }
end

def assuming_that_the_weather_is_not_stormy
  allow(@airport.weather).to receive(:stormy?) { false }
end

def then_plane_can_land_at_airport
  expect { @airport.land(@plane) }.not_to raise_error
end

def given_that_plane_is_in_airport
  @airport.land(@plane)
end

def then_plane_can_take_off
  expect { @airport.take_off(@plane) }.not_to raise_error
end

def then_plane_cannot_take_off
  message = "Stormy weather - plane can't take off!"
  expect { @airport.take_off(@plane) }.to raise_error(message)
end

def given_that_plane_has_taken_off
  @airport.take_off(@plane)
end

def then_user_can_confirm_plane_not_in_airport
  expect(@airport.planes).to eq [] # Empty array
end

def then_plane_cannot_land
  message = "Stormy weather - plane can't land!"
  expect { @airport.land(@plane) }.to raise_error(message)
end

def given_that_the_airport_is_full
  DEFAULT_CAPACITY.times { @airport.land(Plane.new) }
end

def then_another_plane_cannot_land
  message = "Airport is full - plane can't land!"
  expect { @airport.land(@plane) }.to raise_error(message)
end

def then_user_can_confirm_default_capacity
  expect(@airport.capacity).to eq DEFAULT_CAPACITY
end

def given_there_is_another_airport_with_specified_capacity
  @airport_custom = Airport.new(25)
end

def then_user_can_confirm_specified_capacity
  expect(@airport_custom.capacity).to eq 25
end

def then_plane_cannot_take_off_from_another_airport
  message = "Plane can only take off from airport it is in"
  expect { @airport_custom.take_off(@plane) }.to raise_error(message)
end

def then_flying_plane_cannot_take_off
  message = "Flying plane cannot take off"
  expect { @airport.take_off(@plane) }.to raise_error(message)
end

def then_plane_cannot_land_again
  message = "Plane that has already landed cannot land again"
  expect { @airport.land(@plane) }.to raise_error(message)
end

def then_plane_is_not_in_airport
  expect(@plane.current_airport).to eq nil
end

def then_plane_shows_it_is_in_airport
  expect(@plane.current_airport).to eq @airport
end
