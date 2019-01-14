require 'airport'

RSpec.describe Airport do

  it { is_expected.to respond_to(:full?) }
  it { is_expected.to respond_to(:stormy) }
  it { is_expected.to respond_to(:plane_exsist?) }

  it "adds a default capacity" do
    airport = Airport.new
    expect(airport.capacity).to eq 1
  end

  it "allows default capacity to be changed for different airports" do
    airport = Airport.new(20)
    expect(airport.capacity).to eq 20
    airport2 = Airport.new(50)
    expect(airport2.capacity).to eq 50
  end

  describe '#land' do
    it { is_expected.to respond_to(:land) }
    it { is_expected.to respond_to(:land).with(1).argument }

    it "instructs plane to land at airport" do
      airport = Airport.new
      allow(airport).to receive(:stormy).and_return(false)
      plane = Plane.new
      airport.land(plane)
      expect(airport.num_of_planes.include?(plane)).to eq(true)
    end

    it "prevents landing when weather is stormy" do
      airport = Airport.new
      plane = Plane.new
      allow(airport).to receive(:stormy).and_return(true)
      expect { airport.land(plane) }.to raise_error "No landing allowed"
    end

    it "prevents landing when airport is full" do
      airport = Airport.new
      allow(airport).to receive(:stormy).and_return(false)
      plane = Plane.new
      plane1 = Plane.new
      airport.land(plane)
      expect { airport.land(plane1) }.to raise_error("No landing allowed")
    end

    it "prevents landing when already landed" do
      airport = Airport.new
      allow(airport).to receive(:stormy).and_return(false)
      plane = Plane.new
      airport.land(plane)
      expect { airport.land(plane) }.to raise_error("plane landed")
    end

    
  end

  describe '#take_off' do
    it { is_expected.to respond_to(:take_off) }
    it { is_expected.to respond_to(:take_off).with(1).argument }

    it "instructs plane to take off and confirms no longer in airport" do
      airport = Airport.new
      allow(airport).to receive(:stormy).and_return(false)
      plane = Plane.new
      airport.land(plane)
      airport.take_off(plane)
      expect(airport.num_of_planes.include?(plane)).to eq(false)
    end

    it "prevents take off when stormy" do
      airport = Airport.new
      plane = Plane.new
      airport.land(plane)
      allow(airport).to receive(:stormy).and_return(true)
      expect { airport.take_off(plane) }.to raise_error "Too stormy to take off"
    end

    it "only allows take off if plane in airport" do
      airport = Airport.new
      plane = Plane.new
      allow(airport).to receive(:stormy).and_return(false)
      expect { airport.take_off(plane) }.to raise_error "plane is not here"
    end

    it "can only take off from airport its stored in" do
      airport1 = Airport.new
      airport2 = Airport.new
      plane1 = Plane.new
      allow(airport1).to receive(:stormy).and_return(false)
      allow(airport2).to receive(:stormy).and_return(false)
      airport1.land(plane1)
      expect { airport2.take_off(plane1) }.to raise_error("plane is not here")
    end
  end

  describe "#plane_exsist?" do
    it "is that specific plane in airport" do
      airport = Airport.new
      allow(airport).to receive(:stormy).and_return(false)
      plane = Plane.new
      airport.land(plane)
      expect(airport.plane_exsist?(plane)).to eq(true)
    end
  end

  describe "#stormy" do
    it "checks if stormy" do
      airport = Airport.new
      allow(airport).to receive(:stormy).and_return(true)
    end
  end
end
