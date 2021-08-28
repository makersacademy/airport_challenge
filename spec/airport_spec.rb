require 'airport'
describe Airport do

  context 'I want to instruct a plane to land at an airport' do 

    it 'Checks if the airport has the ability to land planes' do
      expect(subject).to respond_to(:land_plane)
    end

  end

end
