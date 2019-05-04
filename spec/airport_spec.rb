require './lib/airport.rb'

describe Airport do

it 'allows planes to land' do
  expect(subject).to respond_to :land_plane
end

end
