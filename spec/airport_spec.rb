require "airport"
describe Airport do

  describe ".new" do
    it "should be an instance of the Airport class" do
      expect(Airport.new).to be_an_instance_of Airport
    end
  end

end
