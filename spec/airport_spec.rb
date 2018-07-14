require 'airport'

describe Airport do

  before(:each) do
    @my_plane = Plane.new
    @my_airport = Airport.new
    @gatwick = Airport.new('Gatwick')
    @lax = Airport.new('L.A.X.')
    @heathrow = Airport.new('Heathrow', 30)
    @boeing = Plane.new('Boeing 747')
    @jetliner = Plane.new('Jetliner')
  end

  describe '#initialize' do
    it 'should set the plane.name to the argument passed' do
      expect(@gatwick.name).to eq 'Gatwick'
    end
    it 'should set the airport.name to the "airport" if no argument is passed' do
      expect(@my_airport.name).to eq 'airport'
    end
  end

  describe '#name' do
    it { is_expected.to respond_to :name }
    it 'should return the name of the airport' do
      expect(@lax.name).to eq 'L.A.X.'
    end
  end

  describe '#capacity' do
    it { is_expected.to respond_to :capacity }
    it 'when using default, should return 20' do
      expect(@lax.capacity).to eq Airport::DEFAULT_CAPACITY
    end
    it 'when setting capacity, should return the argument passed' do
      expect(@heathrow.capacity).to eq 30
    end
  end

  describe '#planes' do
    it { is_expected.to respond_to :planes }
    it 'returns an array' do
      expect(@gatwick.planes).to be_a(Array)
    end
  end

  describe '#land' do
    it { is_expected.to respond_to(:land).with(1).argument }
    context 'when sunny' do
      before(:each) do
        allow(@my_airport).to receive(:stormy?) { false }
        allow(@gatwick).to receive(:stormy?) { false }
        allow(@lax).to receive(:stormy?) { false }
      end
      it "using default names, should puts 'airplane landed at airport'" do
        expect { @my_airport.land(@my_plane) }.to output("airplane landed at airport\n").to_stdout
      end
      it "should set the plane's airport when being called" do
        @my_airport.land(@my_plane)
        expect(@my_plane.airport).to eq @my_airport
      end
    end
    context 'when stormy' do
      before(:each) do
        allow(@my_airport).to receive(:stormy?) { true }
      end
      it "using default names, should raise error" do
        expect { @my_airport.land(@my_plane) }.to raise_error("The weather is too stormy to land")
      end
    end
    context 'when full' do
      before(:each) do
        allow(@gatwick).to receive(:stormy?) { false }
      end
      it 'raises an error' do
        20.times { @gatwick.land(Plane.new) }
        expect { @gatwick.land(Plane.new) }.to raise_error("Gatwick is too full to land")
      end
    end
  end

  describe '#take_off' do
    it { is_expected.to respond_to(:take_off).with(1).argument }
    context 'when sunny' do
      before(:each) do
        allow(@my_airport).to receive(:stormy?) { false }
        allow(@gatwick).to receive(:stormy?) { false }
        allow(@lax).to receive(:stormy?) { false }
      end
      it "should puts '{plane.name} took off from {airport.name}'" do
        @jetliner.land(@my_airport)
        expect { @lax.take_off(@jetliner) }.to output("Jetliner took off from L.A.X.\n").to_stdout
      end
      it "should set the plane's airport to nil after takeoff" do
        @lax.land(@jetliner)
        expect(@jetliner.airport).to eq @lax
        @lax.take_off(@jetliner)
        expect(@jetliner.airport).to eq nil
      end
    end
    context 'when stormy' do
      it "should raise error" do
        allow(@lax).to receive(:stormy?) { false }
        @lax.land(@jetliner)
        allow(@lax).to receive(:stormy?) { true }
        expect { @lax.take_off(@jetliner) }.to raise_error("The weather is too stormy to take off")
      end
    end
  end

  describe '#stormy?' do
    it { is_expected.to respond_to :stormy? }
    it 'should return either true or nil' do
      expect(subject.stormy?).to be(true).or be(nil)
    end
  end

end
