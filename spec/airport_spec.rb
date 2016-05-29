
require 'airport'

describe Airport do 

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
    it 'raises an error when there is no space available at default capacity' do
      Airport::DEFAULT_CAPACITY.times {subject.land(plane)}
      expect{subject.land(plane)}.to raise_error("The airport is full!")
    end 
    it 'raises an error at 11 planes when capacity is set to 10' do
      airport = Airport.new(10)
      10.times {airport.land(plane)}
      expect{airport.land(plane)}.to raise_error("The airport is full!")
    end
    it 'accepts 10 planes when capacity is set to 10' do
      airport = Airport.new(10)
      9.times {airport.land(plane)}
      expect(airport.land(plane)).to eq("The plane has now landed")
    end
  end

  describe '#take_off' do
    it 'allows a plane to take off from the airport' do
      airport.land(plane)
      expect(airport.take_off(plane)).to eq "The plane has taken off"
    end
    it 'won\'t allow a plane to take off if the airport is empty' do
      expect{airport.take_off(plane)}.to raise_error("There are no planes available for take off")
    end
    it 'no longer has the plane after takeoff' do
      allow(plane).to receive(:flying?).and_return(true)
      expect(airport.in_airport?(plane)).to eq false
    end
  end

  describe '#initialize' do
    it 'initialises with one argument' do
      expect{Airport.new(30)}.not_to raise_error
    end
    it 'initialises with default capacity' do
      expect(subject.capacity).to eq Airport::DEFAULT_CAPACITY
    end
  end
end
