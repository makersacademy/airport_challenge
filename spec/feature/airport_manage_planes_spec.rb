require 'capybara/rspec'
require 'plane'
require 'airport'

feature 'plane can be landed and taked off in airport' do
  let(:plane) { Plane.new }
  let(:airport) { Airport.new }

  scenario 'plane can land when airport is not full' do
    expect(airport.full?).to eq false
  end

  scenario 'plane cannot land when airport is full' do
    airport.capacity.times { airport.land(plane) }
    expect { airport.land(plane) }.to raise_error 'The plane cannot land'
  end

  scenario 'plane can land when weather is sunny' do
    expect(airport.unfavourable?).to eq false
  end

  scenario 'plane cannot land in stormy day' do
    airport.unfavourable?
    expect { airport.land(plane) }.to raise_error 'The plane cannot land'
  end

  scenario 'plane cannot take off if weather is stormy' do
    airport.unfavourable?
    expect { airport.take_off }.to raise_error 'The plane cannot take off'
  end
end
