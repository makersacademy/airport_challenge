require 'capybara/rspec'

feature 'a plane landing' do
  let(:airport) { Airport.new }
  let(:plane) { Plane.new }

  scenario 'changes its status to landed in safe conditions' do
    allow(airport).to receive(:bad_weather?).and_return(false)
    airport.land plane
    expect(plane.status).to eq 'landed'
  end

  scenario 'raises error when conditions are unsafe' do
    allow(airport).to receive(:bad_weather?).and_return(true)
    expect { airport.land plane }.to raise_error 'Stormy'
  end
end
