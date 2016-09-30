require './lib/plane'
require './lib/airport'

describe Plane do

  it 'can take off from an airport' do
    expect(subject).to respond_to(:take_off)
  end

  it 'can land at an airport' do
    expect(subject).to respond_to(:land)
    #change so can land at SPECIFIC airport
  end

  it 'tells the controller it has landed' do
    subject.land
    expect(subject.status).to eq("Landed")
  end

  it 'tells the controller it has taken off' do
    subject.take_off
    expect(subject.status).to eq("Has taken off")
  end
end
