require 'capybara/rspec'
require 'plane'

# As a pilot
# So that I can arrive at my specified destination
# I would like to land my plane at the appropriate airport

feature 'plane should land at airport' do
  scenario 'plane should land at airport when told' do
    expect(Plane.new.land).to be
  end
end

# As a pilot
# So that I can set off for my specified destination
# I would like to be able to take off from the appropriate airport

feature 'plane should take-off from airport' do
  scenario 'plane should take-off from airport when told' do
    expect(Plane.new.take_off).to be
  end
end
