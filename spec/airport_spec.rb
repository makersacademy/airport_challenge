require "airport"

describe Airport do
#   subject(:airport) {described_class.new(:capacity)}
#   let(:plane) {double :plane}

  it "expects Airport to make working airports" do
    airport = Airport.new(:capacity)
    expect(airport).to eq airport
  end

  it "has a default capacity" do
    expect(subject.capacity).to eq Airport::DEFAULT_CAPACITY
  end

  describe "#land" do

    before do
      allow(Airport.new).to receive(:stormy?).and_return false
    end     
    # Does not work!!!

    it "airport to land a plane" do
      expect(Airport.new(:capacity)).to respond_to(:land).with(1).argument
    end
    
    it "airport not allow landing when full" do
      subject.capacity.times do
        Airport.new(:capacity).land(Plane.new)
      end
      expect { Airport.new(:capacity).land(Plane.new) }.to raise_error "Error, airport full!"
    end
  end
 

 
  describe "#take_off" do
    it "airport to take_off a plane" do
      expect(Airport.new(:capacity)).to respond_to(:take_off).with(1).argument
    end

    # it 'confirms plane is not in airport after take off' do
    #     plane = Plane.new 
    #     subject.take_off(plane)
    #     expect([planes].include? plane).to eq false
    # end

  end

  it "does not allow to land when weather is stormy" do
    airport = Airport.new(:capacity)
    plane = Plane.new
    allow(airport).to receive(:stormy?).and_return true
    expect { airport.land(plane) }.to raise_error "Error, too stormy!"
  end

  it "does not allow to land when weather is stormy" do
    airport = Airport.new(:capacity)
    plane = Plane.new
    allow(airport).to receive(:stormy?).and_return true
    expect { airport.land(plane) }.to raise_error "Error, too stormy!"
  end
  
end
