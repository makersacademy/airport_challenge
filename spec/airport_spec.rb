require 'airport'

describe Airport do

  let(:plane) { Plane.new }

  describe '#initialize' do
    it 'should initialize an empty array to store planes' do
      expect(subject.planes).to eq []
    end

    it 'should set the default capicty to 30' do
      expect(subject.capacity).to eq 30
    end 

    it 'should allow the default capicty to  be overridden' do
      large_airport = Airport.new(100)
      expect(large_airport.capacity).to eq 100
    end 
  end

  describe '#land' do
    it { is_expected.to respond_to(:land).with(1).argument }

    it 'should allow a plane to land' do
      expect(subject.land(plane)).to eq [plane]
    end


    it 'should prevent landing when airport is full by raising an error' do
      subject.capacity.times { subject.land double :plane }
      expect { subject.land double :plane }.to raise_error 'Unable to land, the airport is full'
    end
  end

  describe '#take_off' do
    it { is_expected.to respond_to(:take_off) }

    it 'should allow a plane to take off' do
      subject.land(plane)
      expect(subject.take_off).to eq plane
    end

    it 'should allow a plane to take off and report plane as not in the airport' do
      subject.land(plane)
      subject.take_off
      expect(plane).to_not be_landed
    end
  end
end
