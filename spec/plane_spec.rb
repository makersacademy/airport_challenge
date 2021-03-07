require 'plane'

describe Plane do
  alias_method :test_plane, :subject
  let (:airport) { double "airport", :name => "airport 1"}
  it 'Responds to a request to return location' do
    expect(test_plane).to respond_to(:location)
  end
  describe 'Plane location is managed' do
    it 'It knows it is in the airport' do
      test_plane.change_location("airport 1")
      expect(test_plane.location).to eq "airport 1"
    end
  end
end
