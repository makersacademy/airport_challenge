require 'capybara/rspec'
require 'airport'
require 'plane'

feature 'Air traffic incoming' do

  let(:plane) { Plane.new }
  let(:airport) { Airport.new }

  scenario 'plane can land' do
    allow(airport).to receive(:weather).and_return('sunny')
    airport.receive plane
    planes = airport.planes
    expect(planes.include? plane).to be true
  end

  scenario 'prevent planes landing when airport is full' do
    allow(airport).to receive(:weather).and_return('sunny')
    airport.capacity.times { airport.receive Plane.new }
    expect { airport.receive Plane.new }.to raise_error 'airport cannot receive planes when at capacity'
  end

  scenario 'a plane cannot land when there is a storm brewing' do
    allow(airport).to receive(:weather).and_return('stormy')
    expect { airport.receive plane }.to raise_error 'plane cannot land when storm brewing'
  end

end