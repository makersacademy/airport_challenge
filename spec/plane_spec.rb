require 'plane'

describe Plane do

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
      it "should set the plane.name to the 'airplane'" do
        expect(@my_plane.name).to eq 'airplane'
      end
    end
    context 'passing optional name parameter' do
      it 'should set the plane.name to the argument passed' do
        expect(@boeing.name).to eq 'Boeing 747'
      end
    end
  end

  describe '#name' do
    it { is_expected.to respond_to :name }
    it 'should return the name of the plane' do
      expect(@boeing.name).to eq 'Boeing 747'
    end
  end

  describe '#airport_name' do
    it { is_expected.to respond_to :airport_name }
    it "returns the name of the plane's current airport (not the airport object)" do
      @jetliner.land(@gatwick)
      expect(@jetliner.airport_name).to eq 'Gatwick'
    end
  end

  describe '#land' do
    it { is_expected.to respond_to(:land).with(1).argument }
    context 'when sunny' do
      it "should puts '{airplane.name} landed at {airport.name}'" do
        expect { @jetliner.land(@gatwick) }.to output("Jetliner landed at Gatwick\n").to_stdout
      end
    end
    context 'when stormy' do
      it "should raise an error" do
        @gatwick.land(@jetliner)
        allow(@gatwick).to receive(:stormy?) { true }
        expect { @jetliner.take_off }.to raise_error("The weather is too stormy to take off")
      end
    end
  end

  describe '#take_off' do
    it { is_expected.to respond_to :take_off }
    context "when sunny" do
      it "should puts '{plane.name} took off from {airport.name}' when called" do
        @gatwick.land(@jetliner)
        expect { @jetliner.take_off }.to output("Jetliner took off from Gatwick\n").to_stdout
      end
      it "should set the plane's airport to nil" do
        @gatwick.land(@jetliner)
        @gatwick.take_off(@jetliner)
        expect(@jetliner.airport).to eq nil
      end
    end
    context 'when stormy' do
      it "should raise an error" do
        @gatwick.land(@jetliner)
        allow(@gatwick).to receive(:stormy?) { true }
        expect { @jetliner.take_off }.to raise_error("The weather is too stormy to take off")
      end
    end
  end

  describe '#make_airport' do
    it { is_expected.to respond_to(:make_airport).with(1).argument }
    it 'should set the instance variable @airport to the argument being passed' do
      @my_plane.make_airport(@lax)
      expect(@my_plane.airport).to eq @lax
    end
  end

end
