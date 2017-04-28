require './lib/init.rb'

feature 'software_designer', :type => :feature do
  scenario 'defining an airport' do
    given_there_is_an_airport
    then_that_airport_has_a_default_capacity
    and_its_capacity_can_be_overridden_as_appropriate
  end

  def given_there_is_an_airport
    @airport = Airport.new
  end

  def then_that_airport_has_a_default_capacity
    expect(@airport.capacity.is_a?(Integer)).to eq true
  end

  def and_its_capacity_can_be_overridden_as_appropriate
    new_capacity = 10
    expect { @airport.capacity = new_capacity }.to_not raise_error
  end
end
