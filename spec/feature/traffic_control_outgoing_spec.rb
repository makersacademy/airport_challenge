require 'capybara/rspec'
require 'airport'
require 'plane'

feature 'Air traffic outgoing' do

  let(:plane) { Plane.new }
  let(:airport) { Airport.new }

  scenario 'plane can take off' do
    allow(airport).to receive(:weather).and_return('sunny')
    airport.receive plane
    airport.launch plane
    expect(airport.planes.include? plane).to be false
  end

  scenario 'a plane cannot take off when there is a storm brewing' do
    allow(airport).to receive(:weather).and_return('stormy')
    expect { airport.launch plane }.to raise_error 'plane cannot take off when storm brewing'
  end

  scenario 'six planes can all take off and change status to "flying"' do
    allow(airport).to receive(:weather).and_return('sunny')
    6.times { airport.receive plane }
    launched = []
    airport.planes.each { |plane| launched << (airport.launch plane)}
    expect(launched.map{ |plane| plane.status == 'flying' }.all?).to be true
  end

end
