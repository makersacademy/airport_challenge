require "airport"


describe Airport do
  it "is expected to respond to airport" do
    airport = Airport.new(1)
    expect(airport).to respond_to(:hangar)
  end

  describe "land(planes)" do
    it "should be able to land a plane" do
      airport = Airport.new(1)
      plane = Plane.new
      allow(airport).to receive(:stormy).and_return("sunny")
      expect(airport.land(plane)).to eq([plane])
    end
  end

  describe "take_off" do
    it "can take off" do
      airport = Airport.new(1)
      plane = Plane.new
      allow(airport).to receive(:stormy).and_return("sunny")
      airport.land(plane)
      expect(airport.take_off).to eq(plane)
    end
  end

  describe "take_off" do
    #this test is not making a new instance of a plane and is
    #not landing anything so there should be nothing at the airport
    airport = Airport.new(1)
    it 'shows when there are no more planes in the airport' do
      expect{airport.take_off}.to raise_error('there are no more planes in the airport')
    end
  end

  describe 'initialize' do
    it 'has a variable capacity and shows full if that capacity is exceded' do
      airport = Airport.new(2)
      allow(airport).to receive(:stormy).and_return("sunny")
      airport.land Plane.new
      allow(airport).to receive(:stormy).and_return("sunny")
      airport.land Plane.new
      expect{ airport.land Plane.new }.to raise_error 'Airport is full'
    end
  end

  describe "land" do
    it "wont happen if its stormy" do
      airport = Airport.new(1)
      plane = Plane.new
      allow(airport).to receive(:stormy).and_return("stormy")
      expect { airport.land(plane) }.to raise_error 'conditions are stormy'
    end
  end
  describe "stormy" do
    it "will return either sunny or stormy" do
    airport = Airport.new(1)
    expect(airport.stormy).to eq("stormy").or eq("sunny")
  end
end 

end
