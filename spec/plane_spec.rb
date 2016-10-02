require 'plane'
require 'airport'

describe Plane do

  it {is_expected.to respond_to :flying?}

  it 'updates flying and status when landing' do
    airport = Airport.new
    airport.land(subject)
    expect(subject.flying).to eq(false)
  end

  it 'updates flying and status after takeoff' do
    airport = Airport.new
    airport.takeoff(subject)
    expect(subject.flying).to eq(true)
  end


end
