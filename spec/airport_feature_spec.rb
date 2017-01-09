require 'capybara/rspec'
require 'airport'

feature 'Feature testing airport functionality' do
  scenario 'Create an airport, then take off and land some planes from it' do
    creates_a_new_airport_with_a_default_full_capacity_of_planes
    takes_off_three_planes
    lands_three_planes
  end

  before(:each) do
    @airport = Airport.new
    @atc = AirTrafficController.new
  end

  def creates_a_new_airport_with_a_default_full_capacity_of_planes
    @airport.capacity.times { Plane.new(@airport) }
    expect(@airport.planes.size).to eq @airport.capacity
  end

  def takes_off_three_planes
    3.times do
      @plane = @airport.planes.sample
      @atc.instruct_to_take_off(@plane, "Sunny")
      @plane.take_off(@airport)
      expect(@airport.airbourne_planes.include?(@plane)).to eq true
    end
  end

  def lands_three_planes
    3.times do
      @plane = @airport.airbourne_planes.sample
      @atc.instruct_to_land(@plane, "Sunny")
      @plane.land(@airport)
      expect(@airport.planes.include?(@plane)).to eq true
    end
  end
end
