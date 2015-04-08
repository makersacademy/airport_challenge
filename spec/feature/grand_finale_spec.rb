require 'capybara/rspec'

feature 'Grand Finale' do

  scenario 'all planes can land' do
    airport = Airport.new
    allow(airport).to receive(:weather) { 'sunny' }
    6.times { airport.land Plane.new }
    expect(airport.planes[5].status). to eq 'landed'
  end

  scenario 'all planes can take off' do
    airport = Airport.new
    allow(airport).to receive(:weather) { 'sunny' }
    6.times { airport.land Plane.new }
    5.times { airport.take_off }
    expect(airport.take_off.status).to eq 'flying'
  end

  scenario 'plane cannot land when it is stormy' do
    airport = Airport.new
    airport.weather = 'stormy'
    expect { airport.land Plane.new }.to raise_error 'Bad Weather'
  end

  scenario 'plane cannot take off when it is stormy' do
    airport = Airport.new
    airport.weather = 'stormy'
    expect { airport.take_off }.to raise_error 'Bad Weather'
  end
end
