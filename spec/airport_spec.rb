require 'airport'

describe Airport do

  describe "#land_plane" do

    it ".land_plane - Airport responds to method" do
      expect(subject).to respond_to(:land_plane)
    end

  end

end
