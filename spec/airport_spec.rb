require 'airport'

describe Airport do

  before(:each) do
    @airport = Airport.new
  end

  describe '#new' do

    it "should allow an Airport object to initalize with default weather as Sunny" do
      expect(@airport.weather).to eq "Sunny"
    end

  end

  describe '#change_weather' do

    it "should set weather as Sunny when a 6 isn't rolled" do
      allow(@airport).to receive(:roll) { 1 }
      @airport.change_weather
      expect(@airport.weather).to eq ("Sunny")
    end

    it "should set weather as Stormy when a 6 is rolled" do
      allow(@airport).to receive(:roll) { 6 }
      @airport.change_weather
      expect(@airport.weather).to eq ("Stormy")
    end

end


  describe '#Take Off' do

    # it "should allow a plane to take off when weather is sunny" do
    #   airport = double(Airport.new, :weather => "Sunny")
    #   (airport.planes).push(Plane.new)
    #   expect(airport.take_off(plane)).to eq "#{plane} has taken off from the airport"
    # end


    # it "should prevent a plane from taking off when weather is stormy" do
    #   airport = double(Airport.new, :weather => "Stormy")
    #   airport.land(plane = Plane.new)
    #   expect { airport.take_off(plane) }.to raise_error "Stormy weather prevents take_off"
    # end

  end

end
