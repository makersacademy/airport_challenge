require "airport"

describe Airport do
  subject(:airport) { described_class.new }

  it "expects Airport to make working airports" do
    expect(subject).to eq subject
  end

  it "has a default capacity" do
    expect(airport.capacity).to eq Airport::DEFAULT_CAPACITY
  end

  it "accepts a new capacity" do
    airport_1 = Airport.new(25)
    expect(airport_1.capacity).to eq 25
  end

  describe "#land" do

    before do
      allow(subject).to receive(:stormy?).and_return false
    end     

    it "airport to land a plane" do
      expect(subject).to respond_to(:land).with(1).argument
    end
    
    it "airport not allow landing when full" do
      subject.capacity.times do
        subject.land(Plane.new)
      end
      expect { subject.land(Plane.new) }.to raise_error "Error, airport full!"
    end
  end
 

  describe "#take_off" do
    it "airport to take_off a plane" do
      expect(subject).to respond_to(:take_off).with(1).argument
    end

    # it 'confirms plane is not in airport after take off' do
    #     plane = Plane.new 
    #     subject.take_off(plane)
    #     expect([planes].include? plane).to eq false
    # end

  end

  it "does not allow to land when weather is stormy" do
    plane = Plane.new
    allow(subject).to receive(:stormy?).and_return true
    expect { subject.land(plane) }.to raise_error "Error, too stormy!"
  end

end
