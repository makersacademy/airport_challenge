require 'airport.rb'

  describe Airport do

    it "Airport has a default capacity" do
      expect(subject.capacity).to eq Airport::DEFAULT_CAPACITY
    end

end
