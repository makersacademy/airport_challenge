require 'airport'
require 'plane'

describe Airport do

  describe 'initialization' do
    it 'defaults capacity' do
      plane = double(:plane)
      allow(plane).to receive(:land).and_return(false)
      Airport::DEFAULT_CAPACITY.times do
        subject.land(plane)
      end
      expect{subject.land(plane)}.to raise_error "Airport full"
    end
  end


  describe "#land" do
    it 'has the plane after it has landed' do
      plane = double(:plane)
      allow(plane).to receive(:land).and_return(false)
      subject.land(plane)
      expect(subject.planes).to include plane
    end

  end

  describe "#take_off" do
    it 'A plane takes off at the airport' do
      plane = double(:plane)
      allow(plane).to receive(:land).and_return(false)
      allow(plane).to receive(:take_off).and_return(true)
      subject.land(plane)
      subject.take_off(plane)
      expect(subject.planes).to eq []
    end

    it 'raise an error when there are no planes to take off' do
      plane = double(:plane)
      allow(plane).to receive(:land).and_return(false)
      allow(plane).to receive(:take_off).and_return(true)
      subject.land(plane)
      subject.take_off(plane)
      expect{subject.take_off(plane)}.to raise_error "There are no planes to take off"
    end
  end


end
