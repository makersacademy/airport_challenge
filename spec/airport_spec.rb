require "airport"

describe Airport do

  plane = Plane.new

  it "responds to #land" do
    expect(subject).to respond_to(:land).with(1).argument
  end

  context 'in clear weather' do

    before(:each) {allow(subject).to receive(:stormy?).and_return(false)}

    it 'will raise an error if instructed to take off with no planes' do
      expect{subject.take_off}.to raise_error 'There are no planes in this airport'
    end

    it 'will allow a plane to take off' do
      subject.land plane
      expect(subject.take_off).to eq plane
    end

    it 'stores a landed plane' do
      subject.land(plane)
      expect(subject.landed_planes).to eq 1
    end

    it 'will not land a plane if the airport is full' do
      Airport::MAX_CAPACITY.times {subject.land(Plane.new)}
      expect{subject.land(plane)}.to raise_error 'Unable to land as airport is full'
    end

   it 'has a maximum capacity that can be overiden' do
     airport = Airport.new(10)
     allow(airport).to receive(:stormy?).and_return(false)
     10.times {airport.land(Plane.new)}
     expect{airport.land(Plane.new)}.to raise_error 'Unable to land as airport is full'
   end

    it 'will not land an already landed plane' do
      subject.land plane
      expect{subject.land(plane)}.to raise_error 'Plane has already landed'
    end
  end

  context 'in stormy weather' do

    before(:each) {allow(subject).to receive(:stormy?).and_return(true)}

    it 'will not take_off' do
      airport = Airport.new
      airport.land plane
      allow(airport).to receive(:stormy?).and_return(true)
      expect{airport.take_off}.to raise_error 'Unable to take off due to poor weather'
    end

    it 'will not land' do
      expect{subject.land(plane)}.to raise_error 'Unable to land due to bad weather'
    end
  end
end
