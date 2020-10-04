require 'airport'
require 'plane'

describe Airport do 
  airport = Airport.new

  it { expect(airport).to be_a Airport }

  it { is_expected.to respond_to(:land).with(1).argument }
  
  it { is_expected.to respond_to :take_off }

  describe '#land(plane)' do
    
    it "lands a plane" do
      airport = Airport.new
      plane = Plane.new
      allow(airport).to receive(:storms?).and_return false
      airport.land(plane)
      expect(airport.planes).to eq [plane]
    end

    it "lands upto 20 planes" do
      airport = Airport.new
      plane = Plane.new
      allow(airport).to receive(:storms?).and_return false

      19.times do airport.land(plane) end
      
      expect(airport.land(plane)).to eq airport.planes
    end

    it "does not land planes if at full capacity" do
      plane = Plane.new
      airport = Airport.new
      allow(airport).to receive(:storms?).and_return false
      20.times { airport.land(plane) }

      expect { airport.land(plane) }.to raise_error 'The airport is full!'
    end

    it "updates the planes flight status to false" do
      plane = Plane.new
      airport = Airport.new
      plane.take_off # sets flight_status to true
      allow(airport).to receive(:storms?).and_return false
      airport.land(plane)

      expect(plane.flight_status).to eq false
    end

    it "should not land planes when stormy" do 
      plane = Plane.new
      airport = Airport.new

      allow(airport).to receive(:storms?).and_return true
      expect { airport.land(plane) }.to raise_error "Cannot land plane: Storms"
    end

  end
    
  it "can have a maximum capacity set buy user" do 
    airport = Airport.new(30)

    expect(airport.capacity).to eq 30
  end

  it "has a default capacity of 20" do
    airport = Airport.new

    expect(airport.capacity).to eq 20
  end

  describe "#take_off" do
    it "should update @planes" do
      airport = Airport.new
      plane = Plane.new
      allow(airport).to receive(:storms?).and_return false
      airport.land(plane)
      airport.take_off(plane)

      expect(airport.planes).to eq []
    end

    it "should change plane flight_status" do
      airport = Airport.new
      plane = Plane.new
      allow(airport).to receive(:storms?).and_return false
      airport.land(plane)
      airport.take_off(plane)

      expect(plane.flight_status).to eq true
    end

    it "does not take off if stormy" do 
      airport = Airport.new
      plane = Plane.new
      airport.land(plane)
      allow(airport).to receive(:storms?).and_return true

      expect { airport.take_off(plane) }.to raise_error "Cannot take off: storms"
    end

    it "should raise an error if plane is not at airport" do
      airport = Airport.new
      plane = Plane.new

      expect { airport.take_off(plane) }.to raise_error "Cannot take off: #{plane} is not at the airport"
    end
  end   
end
