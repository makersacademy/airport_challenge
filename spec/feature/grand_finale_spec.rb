require 'capybara/rspec'

## Note these are just some guidelines!
## Feel free to write more tests!!

# Given 6 planes, each plane must land.
# Be careful of the weather, it could be stormy!
# Check when all the planes have landed that they have status "landed"
# Once all planes are in the air again, check that they have status "flying!"

feature 'Grand Finale' do
  let(:planes) do
    planes = []
    6.times { planes << Plane.new }
    planes
  end
  let(:airport) { Airport.new(capacity: 7, climate: 2) }
  scenario 'all planes can land' do
    planes.each do |plane|
      begin
        airport.land plane
        # rescue LandingUnsafeError => e
        #   puts e.message
        #   retry
      end
    end
    expect(planes).to be_all { |plane| plane.status == 'landed' }
  end
  scenario 'another plane is rejected as default capacity is reached' do
    expect { airport.land Plane.new }.to raise_error
  end
  scenario 'all planes can take off' do
    planes.each do |plane|
      begin
        airport.take_off plane
        # rescue TakeOffUnsafeError => e
        #   puts e.message
        #   retry
      end
    end
    expect(planes).to be_all { |plane| plane.status == 'flying' }
  end
end
