require 'airport'

describe Airport do
  describe "#get_airport_capacity" do
    it 'should return the capacity of the airport' do
      expect(subject.get_airport_capacity).to eq 0
    end
  end

  describe "#get_airport_capacity" do
    it 'should return the capacity of the airport' do
      expect(subject.get_airport_capacity).to eq 0
    end
  end

  describe "#update_airport_capacity" do
    it 'should update the airports capacity with an integer parameter' do
      airport = Airport.new
      airport.update_airport_capacity(20)
      expect(subject.update_airport_capacity(20)).to eq 20
    end
  end

  # describe "#initialize" do
  #   it 'should set up the airport object with an instance variable with weather random_weathers return' do
  #     expect(subject).to eq "stormy" or "sunny"
  #   end
  # end

end
