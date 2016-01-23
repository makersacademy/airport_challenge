require 'plane'

describe Plane do
  it { is_expected.to respond_to :status }

  it 'shows status of landed plane to be arrived' do
    airport = Airport.new
    airport.land subject
    expect(subject.status).to eq :arrived
  end

  it 'shows status of taken off plane to be departed' do
    airport = Airport.new
    airport.land subject
    airport.takeoff subject
    expect(subject.status).to eq :departed
  end
end