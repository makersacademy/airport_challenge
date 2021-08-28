require 'airport'

describe Airport do 
  context "get passenger to destination" do 
    it "instruct plane to land at airport" do 
      Airport.new
      expect(subject).to respond_to(:land_plane)
    end  
  end
end 
