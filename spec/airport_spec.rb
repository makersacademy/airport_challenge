require 'airport'

describe Airport do 
  airport = Airport.new

  it { expect(airport).to be_a Airport }

  it { is_expected.to respond_to(:land).with(1).argument }
  
  it { is_expected.to respond_to :take_off }

  it "knows that planes are in flight" do
    plane = airport.take_off
    expect(plane).to be_in_flight
  end

  it { is_expected.to respond_to :plane }

  describe '#land(plane)' do
    it "lands a plane" do
      plane = Plane.new
      expect(airport.land(plane)).to eq plane
    end

    it "does not land planes if at full capacity" do
      plane = Plane.new
      airport = Airport.new
      airport.land(plane)

      expect { airport.land(plane) }.to raise_error 'The airport is full!'
    end
  end

end
