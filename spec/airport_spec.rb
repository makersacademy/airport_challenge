require 'airport'
require 'plane'

describe Airport do

  before(:each) do
    @plane = Plane.new
    @airport = Airport.new()
  end

  describe '#land' do
    it { is_expected.to respond_to(:land).with(1).argument }
  end

  describe '#take_off' do
    it { is_expected.to respond_to(:take_off).with(1).argument }
  end

  describe '#it_stormy' do
    it { is_expected.to respond_to(:stormy?) }
  end

  context '#it_stormy creates sunny conditions' do
    it 'lets sunny conditions be observed' do
      allow(@airport).to receive(:stormy) { false }
    end
  end

  describe '#empty' do
    it 'lets the controller check that a plane has left the airport' do
      @airport.take_off(@plane)
      expect(@airport).to be_empty
    end
  end

  context 'plane landing when the airport is full' do
    it 'lets the contoller stop planes from landing' do
      expect { 6.times { @airport.land(@plane) } }.to raise_error("The airport is full")
    end
  end

  context 'capactity for the airport is modified' do
    it 'lets the controller set the capacity' do
      airport = Airport.new(10)
      expect { 10.times { airport.land(@plane) } }.not_to raise_error
    end
  end

  context 'default capacity for the airport is selected when a new value is not supplied' do
    it 'sets to default capacity' do
      expect { 10.times { @airport.land(@plane) } }.to raise_error("The airport is full")
    end
  end

  context 'bad weather conditions' do
    before(:each) do
      @obj = double()
    end
    it 'blocks landing' do
      allow(@obj).to receive(:stormy?).and_return(true)
      allow(@obj).to receive(:land).and_return("Bad weather, no landing")
    end
    it 'blocks taking off' do
      allow(@obj).to receive(:stormy?).and_return(true)
      allow(@obj).to receive(:take_off).and_return("Bad weather, no taking off")
    end
  end
end
