require 'airport'

describe Airport do

  describe '#initialize' do
    it 'should set the plane.name to the argument passed' do
      my_airport = Airport.new('Gatwick')
      expect(my_airport.name).to eq 'Gatwick'
    end
    it 'should set the airport.name to the "airport" if no argument is passed' do
      my_airport = Airport.new
      expect(my_airport.name).to eq 'airport'
    end
  end

  describe '#name' do
    it { is_expected.to respond_to :name }
    it 'should return the name of the airport' do
      my_plane = Plane.new('L.A.X.')
      expect(my_plane.name).to eq 'L.A.X.'
    end
  end

  describe '#land' do
    it { is_expected.to respond_to(:land).with(1).argument }
    it "when sunny, using default names, should puts 'airplane landed at airport'" do
      my_plane = Plane.new
      my_airport = Airport.new
      allow(my_airport).to receive(:stormy?) { false }
      expect { my_airport.land(my_plane) }.to output("airplane landed at airport\n").to_stdout
    end
    it "when sunny, should set the plane's airport when being called" do
      my_plane = Plane.new
      my_airport = Airport.new
      allow(my_airport).to receive(:stormy?) { false }
      my_airport.land(my_plane)
      expect(my_plane.airport).to eq my_airport
    end
    it "when stormy, using default names, should raise error" do
      my_plane = Plane.new
      my_airport = Airport.new
      allow(my_airport).to receive(:stormy?) { true }
      expect { my_airport.land(my_plane) }.to raise_error("The weather is too stormy to land")
    end
  end

  describe '#take_off' do
    it { is_expected.to respond_to(:take_off).with(1).argument }
    it "when sunny, should puts '{plane.name} took off from {airport.name}'" do
      jetliner = Plane.new('Jetliner')
      lax = Airport.new('L.A.X.')
      allow(lax).to receive(:stormy?) { false }
      jetliner.land(lax)
      allow(lax).to receive(:stormy?) { false }
      expect { lax.take_off(jetliner) }.to output("Jetliner took off from L.A.X.\n").to_stdout
    end
    it "when sunny, should set the plane's airport to nil after takeoff" do
      jetliner = Plane.new('Jetliner')
      lax = Airport.new('L.A.X.')
      allow(lax).to receive(:stormy?) { false }
      jetliner.land(lax)
      expect(jetliner.airport).to eq lax
      allow(lax).to receive(:stormy?) { false }
      jetliner.take_off
      expect(jetliner.airport).to eq nil
    end
    it "when stormy, should raise error" do
      jetliner = Plane.new('Jetliner')
      lax = Airport.new('L.A.X.')
      allow(lax).to receive(:stormy?) { false }
      jetliner.land(lax)
      allow(lax).to receive(:stormy?) { true }
      expect { lax.take_off(jetliner) }.to raise_error("The weather is too stormy to take off")
    end
  end

  describe '#stormy?' do
    it { is_expected.to respond_to :stormy? }
    it 'should return a boolean' do
      expect(subject.stormy?).to be(true).or be(false)
    end
    it 'should return true if rolls true (roll = 10)' do
      airport = Airport.new
      allow(airport).to receive(:stormy?) { true }
      expect(airport.stormy?).to eq true
    end
    it 'should return false if rolls false (roll < 10)' do
      airport = Airport.new
      allow(airport).to receive(:stormy?) { false }
      expect(airport.stormy?).to eq false
    end
  end

end
