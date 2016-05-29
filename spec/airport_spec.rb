require 'airport'

describe Airport do 

  it { is_expected.to respond_to(:land).with(1).argument }
  it { is_expected.to respond_to(:take_off).with(1).argument }

  let(:plane) {double(:plane, landed?: false, flying?: true, land: nil, take_off: nil)}
  
  subject(:airport) { described_class.new }

  describe '#land' do

    it 'allows a flying plane to land' do
      expect(airport.land(plane)).to eq "The plane has now landed"
    end

    it 'houses the plane at the airport after landing' do
     airport.land(plane)
     expect(airport.in_airport?(plane)).to eq true
    end

    it 'will raise an error if a plane has already landed' do
      allow(plane).to receive(:landed?).and_return true
      expect{airport.land(plane)}.to raise_error("This plane has already landed")
    end
  end

  describe '#take_off' do
    it 'allows a plane to take off from the airport' do
    airport.land(plane)
    expect(airport.take_off(plane)).to eq "The plane has taken off"
    end

    it 'won\'t allow a plane to take off if the airport is empty' do
      expect{airport.take_off(plane)}.to raise_error("The airport is empty. There are no planes available for take off")
    end

    it 'no longer has the plane after takeoff' do
      airport.land(plane)
      airport.take_off(plane)
      allow(plane).to receive(:flying?).and_return(true)
      expect(airport.in_airport?(plane)).to eq false
    end
  end
end




  

    