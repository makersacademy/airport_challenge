require 'plane'
require 'airport'
require 'air_traf_con'

describe Plane do

  it 'has a location at an Airport that can be read and changed' do
    subject.location = "O'Hare"
    expect(subject.location).to eq("O'Hare")
  end

  it 'reports when it leaves an airport' do
    subject.location = "O'Hare"
    expect(subject.takeoff).to eq "Leaving O'Hare"
  end

  it 'has a status of flying that can be read and changed' do
    subject.flying = true
    expect(subject.flying).to be true
  end

end
