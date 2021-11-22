require 'airport'

describe Airport do
  context "(airport capacity)" do

    it "allows user to set aiport capactiy when new Airport is initialized" do
      heathrow = Airport.new(150)
      expect(heathrow.capacity).to eq 150
    end
  
    it "sets airport capacity to DEFAULT_CAPACITY if no value is set by the user" do
      heathrow = Airport.new
      expect(heathrow.capacity).to eq Airport::DEFAULT_CAPACITY
    end

  end

end
