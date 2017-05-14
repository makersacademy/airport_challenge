require 'airport.rb'

  describe Airport do

    it "Airport has a default capacity" do
      expect(subject.capacity).to eq Airport::DEFAULT_CAPACITY
    end

    it "Airport capacity can change to a new value" do
      subject.capacity= 12
      expect(subject.capacity).to eq 12
    end


end
