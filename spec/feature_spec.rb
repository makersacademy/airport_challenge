require 'airport'
require 'capybara/rspec'

feature 'Feature testing airport functionality' do
  scenario 'Create an airport, take off 3 planes and land 3 planes' do
    creates_a_new_airport_with_capacity_of_three
    takes_off_three_planes
    lands_three_planes
  end

before (:each ) do
	 @airport = Airport.new(3)
	 @plane = Plane.new
end

def creates_a_new_airport_with_capacity_of_three
    @airport
  end

  def takes_off_three_planes

    3.times do
	allow(@airport).to receive(:stormy?) {false}
    	@airport.land(@plane)
    	end
    	expect(@airport.planes).to eq [@plane,@plane,@plane]
  end

  def lands_three_planes
    3.times do
    	allow(@airport).to receive(:full?) {false}
      allow(@airport).to receive(:stormy?) {false}
      @airport.take_off(@plane)
      expect(@airport.planes).to eq []
    end
  end

  end


