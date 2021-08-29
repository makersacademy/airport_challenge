require 'airport'

describe Airport do

  context 'So I can get passengers to a destination' do 

    it 'Checks if the airport can land planes' do
      expect(subject).to respond_to(:land_plane)
    end
  end
end