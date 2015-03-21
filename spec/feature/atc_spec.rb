require 'capybara/rspec'
require 'plane'

# As an air traffic controller
# So that I can avoid collisions
# I want to be able to prevent airplanes landing when the airport if full

feature 'plane should not land at airport when airport is full' do
  scenario 'plane should not land at airport when airport is full' do
    expect { Plane.new.land }.to raise_error 'Airport Full'
  end
end

# As an air traffic controller
# So that I can avoid accidents
# I want to be able to prevent airplanes landing when the weather is stormy

feature 'plane should not land at airport when weather is stormy' do
  scenario 'plane should not land at airport when weather is stormy' do
    expect { Plane.new.land }.to raise_error 'Weather Stormy'
  end
end
