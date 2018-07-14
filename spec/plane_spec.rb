require 'plane'

describe Plane do

  describe '#initialize' do
    it 'should set the plane.name to the argument passed' do
      my_plane = Plane.new('Boeing 747')
      expect(my_plane.name).to eq 'Boeing 747'
    end
    it 'should set the plane.name to the "airplane" if no argument is passed' do
      my_plane = Plane.new
      expect(my_plane.name).to eq 'airplane'
    end
  end

  describe '#name' do
    it { is_expected.to respond_to :name }
    it 'should return the name of the plane' do
      my_plane = Plane.new('Boeing 747')
      expect(my_plane.name).to eq 'Boeing 747'
    end
  end

  describe '#airport_name' do
    it { is_expected.to respond_to :airport_name }
    it "returns the name of planes current airport (not the airport object)" do
      jetliner = Plane.new('Jetliner')
      gatwick = Airport.new('Gatwick')
      allow(gatwick).to receive(:stormy?) { false }
      jetliner.land(gatwick)
      expect(jetliner.airport_name).to eq 'Gatwick'
    end
  end

  describe '#take_off' do
    it { is_expected.to respond_to :take_off }
    it "when sunny, should puts '{plane.name} took off from {airport.name}' when called" do
      plane = Plane.new('Jetliner')
      airport = Airport.new('Gatwick')
      allow(airport).to receive(:stormy?) { false }
      airport.land(plane)
      allow(airport).to receive(:stormy?) { false }
      expect { plane.take_off }.to output("Jetliner took off from Gatwick\n").to_stdout
    end
    it "when sunny, should set the plane's airport to nil" do
      plane = Plane.new('Jetliner')
      airport = Airport.new('Gatwick')
      allow(airport).to receive(:stormy?) { false }
      airport.land(plane)
      allow(airport).to receive(:stormy?) { false }
      airport.take_off(plane)
      expect(plane.airport).to eq nil
    end
    it "when stormy, should raise an error" do
      plane = Plane.new('Jetliner')
      airport = Airport.new('Gatwick')
      allow(airport).to receive(:stormy?) { false }
      airport.land(plane)
      allow(airport).to receive(:stormy?) { true }
      expect { plane.take_off }.to raise_error("The weather is too stormy to take off")
    end
  end

  describe '#land' do
    it { is_expected.to respond_to(:land).with(1).argument }
    it "when sunny, using default names, should puts 'airplane landed at airport'" do
      my_plane = Plane.new
      my_airport = Airport.new
      allow(my_airport).to receive(:stormy?) { false }
      expect { my_plane.land(my_airport) }.to output("airplane landed at airport\n").to_stdout
    end
    it "when sunny, using given names, should puts '{airplane.name} landed at {airport.name}'" do
      jetliner = Plane.new('Jetliner')
      gatwick = Airport.new('Gatwick')
      allow(gatwick).to receive(:stormy?) { false }
      expect { jetliner.land(gatwick) }.to output("Jetliner landed at Gatwick\n").to_stdout
    end
  end

  describe '#make_airport' do
    it { is_expected.to respond_to(:make_airport).with(1).argument }
    it 'should set the instance variable @airport to the argument being passed' do
      plane = Plane.new('Boeing 777')
      airport = Airport.new
      plane.make_airport(airport)
      expect(plane.airport).to eq airport
    end
  end

end
