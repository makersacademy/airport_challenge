require 'airport'

describe Airport do 
  airport = Airport.new

  it { expect(airport).to be_a Airport }

  it { is_expected.to respond_to(:land).with(1).argument }
  
  it { is_expected.to respond_to :take_off }

  it { is_expected.to respond_to :plane }

  describe '#land(plane)' do
    it "lands a plane" do
      airport = Airport.new
      plane = Plane.new
      airport.land(plane)

      expect(airport.planes).to eq [plane]
    end

    it "lands upto 20 planes" do
      airport = Airport.new
      plane = Plane.new
      19.times do airport.land(plane) end
      
      expect(airport.land(plane)).to eq airport.planes
    end

    it "does not land planes if at full capacity" do
      plane = Plane.new
      airport = Airport.new
      20.times { airport.land(plane) }

      expect { airport.land(plane) }.to raise_error 'The airport is full!'
    end

    it "updates the planes flight status to false" do
      plane = Plane.new
      airport = Airport.new
      plane.take_off # sets flight_status to true
      airport.land(plane)

      expect(plane.flight_status).to eq false
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
      airport.land(plane)
      airport.take_off

      expect(airport.planes).to eq []
    end

    it "should change plane flight_status" do
      airport = Airport.new
      plane = Plane.new
      airport.land(plane)
      airport.take_off

      expect(plane.flight_status).to eq true
    end
  end

end
