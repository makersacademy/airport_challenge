require 'airport'

describe AirportController do
    it 'responds to land_plane' do
        expect(subject).to respond_to :land_plane
      end
end