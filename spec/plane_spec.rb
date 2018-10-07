require "plane"

describe Plane do
  describe 'plane status check' do

    it 'checks default = air when no airport given' do
      plane = Plane.new
      expect(plane.status?).to eq "air"
    end

    it 'checks default = land when airport given' do
      airport = Airport.new
      plane = Plane.new(airport)
      expect(plane.status?).to eq "land"
    end

    it 'is flying if not checked into an airport on creation' do
      plane = Plane.new
      expect(plane.flying?).to eq true
    end

    it 'is NOT flying if given a home airport' do
      airport = Airport.new
      plane = Plane.new(airport)
      expect(plane.flying?).to eq false
    end

    it 'plane is in airport hangar when airport given' do
      airport = Airport.new
      plane = Plane.new(airport)
      expect(airport.in_hangar(plane)).to eq true
    end

    it 'plane is NOT in airport hangar when no airport given' do
      airport = Airport.new
      plane = Plane.new
      expect(airport.in_hangar(plane)).to eq false
    end

    it 'checks if a plane is NOT in any airport' do
      plane = Plane.new
      expect(plane.in_airport?).to be_empty
    end

    it 'checks that a new plane is in its home airport' do
      airport = Airport.new
      plane = Plane.new(airport)
      expect(plane.in_airport?[0]).to eq airport
    end
  end
  # context('when the weather is sunny') do
  #   before(:each) do
  #     allow(Airport).to receive(:stormy?).and_return(false)
  #   end
  describe 'plane status check' do
    it 'checks that a new plane is in only one airport after take off and land at another airport' do

      airport = Airport.new
      allow(airport).to receive(:stormy?).and_return(false)
      # airport.update_weather("sunny")
      airport2 = Airport.new
      allow(airport2).to receive(:stormy?).and_return(false)
      # airport2.update_weather("sunny")
      plane = Plane.new(airport)
      airport.takeoff(plane)
      airport2.land(plane)
      expect(plane.in_airport?.count).to eq 1
    end

    it 'new plane is in airport2 after take off from airport1 and land at airport2' do
      airport1 = Airport.new
      allow(airport1).to receive(:stormy?).and_return(false)
      # airport.update_weather("sunny")
      airport2 = Airport.new
      allow(airport2).to receive(:stormy?).and_return(false)
      # airport2.update_weather("sunny")
      plane = Plane.new(airport1)
      airport1.takeoff(plane)
      airport2.land(plane)
      expect(plane.in_airport?[0]).to eq airport2
    end

  end

  describe 'manually update plane status' do
    it 'sets plane status - land to air' do
      plane = Plane.new
      expect(plane.update_status("air")).to eq "air"
    end
  end
end
