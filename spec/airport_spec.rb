require 'airport'
require './lib/plane'

describe Airport do

it 'confirms when a plane has left the airport' do
  expect(subject.release_plane.depart_from_airport).to eq true
end

  # it 'confirms plane has left airport when it takes off'


end
