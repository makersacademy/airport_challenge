require 'spec_helper'
require 'airport'
require 'weather'
require 'plane'

feature 'Feature test - Planes take off and land' do

scenario 'given varying weather' do
  create_entities
  a_plane_can_land_at_an_airport
  a_plane_can_report_its_correct_landed_status
  a_plane_cannot_take_off_from_a_different_airport
  a_plane_can_take_off_from_that_airport
  a_flying_plane_cannot_take_off_again
  a_plane_can_report_its_correct_takeoff_status
  end

def create_entities
  @klm = Plane.new
	@jfk = Airport.new
  @lax = Airport.new
	@weather = Weather.new
end

  def a_plane_can_land_at_an_airport
  	expect(@klm.land(@weather, @jfk)).to eq :landed
  end

  def a_plane_can_report_its_correct_landed_status
    expect(@klm.confirm_status).to eq :landed
  end

  def a_plane_cannot_take_off_from_a_different_airport
    message = "Plane is not at that airport"
    expect { @klm.take_off(@weather, @lax)  }. to raise_error message
  end

  def a_plane_can_take_off_from_that_airport
  	expect(@klm.take_off(@weather, @jfk)).to eq :in_air
  end

  def a_flying_plane_cannot_take_off_again
    message = "I am already in the air"
  	expect { @klm.take_off(@weather, @jfk) }. to raise_error message
  end

  def a_plane_can_report_its_correct_takeoff_status
  	expect(@klm.confirm_status).to eq :in_air
  end

end
