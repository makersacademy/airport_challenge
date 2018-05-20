require 'airport'

describe Airport do

# --- tests working ---
  context "#initialize" do
    it "makes capacity an integer" do
      expect(subject.capacity).to be_an Integer
    end
    it "makes planes an array" do
      airport = Airport.new
      expect(subject.planes).to be_an Array
    end
    it { is_expected.to respond_to(:capacity) }
  end

  context '#land' do
    it "fails if the airport is full" do
      expect {subject.land(Plane)}.to raise_error "The airport is full"
    end
    it "confirms a plane has landed." do
      airport = Airport.new
      airport.land(Plane)
      expect(subject.land(Plane)).to eq "The plane has landed."
    end
    it "returns the array of planes" do
      airport = Airport.new
      plane_ num = airport.planes.count
      expect(subject.planes.count).to eq plane_num
    end
  end

  context '#airport_full?' do
  end

end

# require_relative './lib/airport.rb'
