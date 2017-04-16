require 'plane'
require 'weather'

describe Airplane do


describe '#landed?' do
  it 'checks if a plane has landed' do
    allow(Weather).to receive(:stormy?).and_return(false)
    airport = Airport.new
    airport.land(Airplane.new)
    expect(subject.landed?).to eq true
end
end

describe '#taken off?' do
  it 'checks a plain has taken off' do
  allow(Weather).to receive(:stormy?).and_return(false)
  airport = Airport.new
  airport.take_off(Airplane.new)
  expect(subject.taken_off?).to eq true

  #it {is_expected.to respond_to :taken_off?}
end
end




  #it {is_expected.to respond_to :docked?}
end
