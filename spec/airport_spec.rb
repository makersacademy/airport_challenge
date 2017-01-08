require 'airport'

describe Airport do

  describe 'Landing Planes' do
    it 'responds to the method land' do
      expect(subject).to respond_to(:instruct_landing).with(1).argument
    end

    it 'stores a plane in the airport when landing' do
      plane = Plane.new
      expect(subject.instruct_landing(plane).last).to eq(plane)
    end

    it 'plane has landed and confirms landing' do
      plane = Plane.new
      subject.instruct_landing(plane)
      expect(plane.status).to eq("The plane has landed")
    end

    it 'raises error if plane has already landed' do
      plane = Plane.new
      subject.instruct_landing(plane)
      expect {subject.instruct_landing(plane)}.to raise_error("The plane has already landed")
    end

    it 'raises an error when there is no space in the airport for a plane to land' do
      Airport::DEFAULT_CAPACITY.times { subject.instruct_landing(Plane.new) }
      expect {subject.instruct_landing(Plane.new)}.to raise_error("There is no space in the airport")
    end
  end

  describe 'Planes Taking Off' do
    it 'responds to the method take-off' do
      expect(subject).to respond_to(:instruct_take_off).with(1).argument
    end

    it 'returns plane when taking off' do
      plane = Plane.new
      subject.instruct_landing(plane)
      expect(subject.instruct_take_off(plane)).to eq(plane)
    end

    it 'plane takes off and confirms it is no longer in the airport' do
      plane = Plane.new
      subject.instruct_landing(plane)
      subject.instruct_take_off(plane)
      expect(plane.status).to eq("The plane has taken off")
    end

    it 'raises error if plane has already taken-off (if there is more than one plane in the airport to begin with)' do
      # didn't work with 2.times { subject.instruct_landing(Plane.new) }
      plane = Plane.new
      subject.instruct_landing(plane)
      plane = Plane.new
      subject.instruct_landing(plane)
      subject.instruct_take_off(plane)
      expect {subject.instruct_take_off(plane)}.to raise_error("The plane has already taken off")
    end

    it 'raises an error when there are no planes to take off from the airport' do
      expect {subject.instruct_take_off(Plane.new)}.to raise_error("There are no planes in the airport")
    end

  end

  describe 'Setting Capacity' do
    it 'the airport has a default capacity of 3 planes' do
      airport = Airport.new
      expect(airport.capacity).to eq(3)
    end

    it 'the airport can have a capacity of 20 planes' do
      airport = Airport.new(20)
      expect(airport.capacity).to eq(20)
    end

  end

end
