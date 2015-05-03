require 'capybara/rspec'
require 'airport'
require 'plane'

feature 'Air traffic incoming' do

  let(:plane) { Plane.new }
  let(:airport) { Airport.new }

  scenario 'plane can land' do
    allow(airport).to receive(:weather).and_return('sunny')
    airport.receive plane
    expect(airport.planes.include? plane).to be true
  end

  scenario 'prevent planes landing when airport is full' do
    allow(airport).to receive(:weather).and_return('sunny')
    airport.capacity.times { airport.receive plane }
    expect { airport.receive plane }.to raise_error 'airport cannot receive planes when at capacity'
  end

  scenario 'a plane cannot land when there is a storm brewing' do
    allow(airport).to receive(:weather).and_return('stormy')
    expect { airport.receive plane }.to raise_error 'plane cannot land when storm brewing'
  end

  scenario 'six planes can all land and change status to "landed"' do
    allow(airport).to receive(:weather).and_return('sunny')
    6.times { airport.receive plane }
    expect(airport.planes.map{ |plane| plane.status == 'landed' }.all?).to be true
  end

end