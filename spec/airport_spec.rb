require 'airport.rb'

  describe Airport do

    it "Airport has a default capacity" do
      expect(subject.capacity).to eq Airport::DEFAULT_CAPACITY
    end

    it "Airport capacity can change to a new value" do
      subject.capacity= 12
      expect(subject.capacity).to eq 12
    end


    it "If there is space after planes takeing off from a full airport, another plane can land in the airport " do
      num = Airport::DEFAULT_CAPACITY
      planes = (0..num-1).map{Plane.new}
      planes.each{|plane| plane.land(subject)}
      planes[-1].take_off(subject)
      plane = Plane.new
      plane.land(subject)
    end

end
