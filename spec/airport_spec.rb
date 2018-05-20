require 'airport'

describe Airport do

# --- initialize tests working ---
  context "#initialize" do
    it "makes capacity an integer" do
      expect(subject.capacity).to be_an Integer
    end
    it "makes planes an array" do
      expect(subject.planes).to be_an Array
    end
    it { is_expected.to respond_to(:capacity) }
  end

  context '#land' do
    it "fails if the airport is full" do
      expect { subject.land(Plane) }.to raise_error "The airport is full"
    end
    it "fails if weather is stormy" do
      allow(Plane).to receive(:stormy?).and_return(true)
      expect { subject.land(Plane) }.to raise_error "Weather is too stormy to land"
    end
    it "confirms a plane has landed." do
      airport = Airport.new
      airport.land(Plane)
      expect(airport.land(Plane)).to eq "The plane has landed."
    end
    it "returns the array of planes" do
      expect(subject.planes).to be_an Array
    end
  end

  context "#take_off" do
    it "fails if weather is stormy" do
      allow(Plane).to receive(:stormy?).and_return(true)
      subject.take_off(Plane)
      expect { subject.take_off(Plane) }.to raise_error "Weather is too stormy to take off"
    end
    it "confirms a plane has departed." do
      airport = Airport.new
      airport.land(Plane)
      expect(airport.take_off(Plane)).to eq "This plane has now departed"
    end
    it "removes a plane from the airport" do
      expect(subject.planes.pop).to eq :planes.count
    end
  end

  context '#airport_full?' do
    it "is the current capacity of planes" do
      expect(subject.planes.count).to be_an Integer
    end
  end

end

# require_relative './lib/airport.rb'
