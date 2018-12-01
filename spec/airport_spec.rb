require 'airport.rb'

describe Airport do

  describe ".land" do
    it "lands a plane at the airport" do
      expect(subject).to respond_to :land
      
    end
  end

end

describe Plane do

end
