require 'capybara/rspec'
require 'plane'

feature 'plane should not land at airport in certain circumstances' do
  let(:plane) { Plane.new }

  # As an air traffic controller
  # So that I can avoid collisions
  # I want to be able to prevent airplanes landing when the airport if full

  scenario 'plane should not land at airport when airport is full' do
    expect { plane.land }.to raise_error 'Airport Full'
  end

  # As an air traffic controller
  # So that I can avoid accidents
  # I want to be able to prevent airplanes landing when the weather is stormy

  scenario 'plane should not land at airport when weather is stormy' do
    allow(plane.land).to receive(:stormy?) { true }
    puts plane.land
    expect { plane.land }.to raise_error 'Weather Stormy'
  end
end
