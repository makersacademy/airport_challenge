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
    allow(@my_airport).to receive(:stormy?) { nil }
    allow(@gatwick).to receive(:stormy?) { nil }
    allow(@lax).to receive(:stormy?) { nil }
  end

  describe '#initialize' do
    context 'passing no parameters' do
      it 'should set the airport.name to "airport" if no argument is passed' do
        expect(@my_airport.name).to eq 'airport'
      end
      it 'should set the airport.capacity to default capacity if no argument is passed' do
        expect(@gatwick.capacity).to eq Airport::DEFAULT_CAPACITY
      end
    end
    context 'passing optional parameters' do
      it 'should set the airport.name to the first argument passed' do
        expect(@gatwick.name).to eq 'Gatwick'
      end
      it 'should set the airport.capacity to the second argument passed' do
        expect(@heathrow.capacity).to eq 30
      end

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
    context 'passing no capacity parameter' do
      it 'should return 20 (DEAFAULT_CAPACITY)' do
        expect(@lax.capacity).to eq Airport::DEFAULT_CAPACITY
      end
    end
    context 'passing optional capacity parameter' do
      it 'when setting capacity, should return the argument passed' do
        expect(@heathrow.capacity).to eq 30
      end
    end
  end

  describe '#planes' do
    it { is_expected.to respond_to :planes }
    it 'returns a hash' do
      expect(@gatwick.planes).to be_an(Array)
    end
  end

  describe '#planes_by_name' do
    it { is_expected.to respond_to :planes_by_name }
    it "puts a string containing all planes' names currently in an airport" do
      @lax.land(@jetliner)
      3.times { @lax.land(Plane.new) }
      @boeing.land(@lax)
      expect { @lax.planes_by_name }.to output("Jetliner, airplane, airplane, airplane, Boeing 747\n").to_stdout
    end
  end

  describe '#land' do
    it { is_expected.to respond_to(:land).with(1).argument }
    context 'when sunny' do
      it "should puts '{airplane.name} landed at {airport.name}'" do
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
      it "should raise error" do
        expect { @my_airport.land(@my_plane) }.to raise_error("The weather is too stormy to land")
      end
    end
    context 'when full' do
      it 'raises an error' do
        20.times { @gatwick.land(Plane.new) }
        expect { @gatwick.land(Plane.new) }.to raise_error("Gatwick is too full to land")
      end
    end
  end

  describe '#take_off' do
    it { is_expected.to respond_to(:take_off).with(1).argument }
    context 'when passing a string instead of a plane object' do
      it 'should raise an error telling user to use take_off_by_name' do
        @lax.land(@boeing)
        expect { @lax.take_off("Boeing 747") }.to raise_error("Try using take_off_by_name instead")
      end
    end
    context 'when sunny' do
      it "should set the plane's airport to nil after takeoff" do
        @lax.land(@jetliner)
        expect(@jetliner.airport).to eq @lax
        @lax.take_off(@jetliner)
        expect(@jetliner.airport).to eq nil
      end
      it "should puts '{plane.name} took off from {airport.name}'" do
        @jetliner.land(@my_airport)
        expect { @lax.take_off(@jetliner) }.to output("Jetliner took off from L.A.X.\n").to_stdout
      end
    end
    context 'when stormy' do
      it "should raise error" do
        @lax.land(@jetliner)
        allow(@lax).to receive(:stormy?) { true }
        expect { @lax.take_off(@jetliner) }.to raise_error("The weather is too stormy to take off")
      end
    end
  end

  describe '#take_off_by_name' do
    it { is_expected.to respond_to(:take_off_by_name).with(1).argument }
    context 'when passing a plane object instead of a string' do
      it 'should raise an error telling user to use take_off' do
        @lax.land(@boeing)
        expect { @lax.take_off_by_name(@boeing) }.to raise_error("Try using take_off instead")
      end
    end
    context 'when sunny' do
      it "should set the plane's airport to nil after takeoff" do
        @lax.land(@jetliner)
        expect(@jetliner.airport).to eq @lax
        @lax.take_off_by_name("Jetliner")
        expect(@jetliner.airport).to eq nil
      end
      it "should puts '{plane.name} took off from {airport.name}'" do
        @boeing.land(@lax)
        expect { @lax.take_off_by_name("Boeing 747") }.to output("Boeing 747 took off from L.A.X.\n").to_stdout
      end
    end
    context 'when stormy' do
      it "should raise error" do
        @lax.land(@jetliner)
        allow(@lax).to receive(:stormy?) { true }
        expect { @lax.take_off_by_name("Jetliner") }.to raise_error("The weather is too stormy to take off")
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
