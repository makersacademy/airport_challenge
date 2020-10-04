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
      19.times do airport.land(plane) end
      
      expect(airport.land(plane)).to eq airport.planes
    end

    it "does not land planes if at full capacity" do
      plane = Plane.new
      airport = Airport.new
      20.times { airport.land(plane) }

      expect { airport.land(plane) }.to raise_error 'The airport is full!'
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
end
