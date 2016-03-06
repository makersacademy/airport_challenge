require 'airport'

describe Airport do
let(:plane) {double :airplane}

  describe 'planes array' do
    it 'should have an empty planes array on initialization' do
      expect(subject.planes).to eq []
    end
  end

  describe 'capacity' do
    it 'should respond to capacity' do
      expect(subject).to respond_to :capacity
    end

    it 'should have a default capacity of 10 when initialized.' do
      expect(subject.capacity).to eq 10
    end


    it 'should respond to full? method' do
      expect(subject).to respond_to :full?
    end

    it 'should set a capacity if initialized with an argument' do
      airport = Airport.new(5)
      expect(airport.capacity).to eq 5
    end
  end

  describe 'weather' do
    it 'should respond to stormy? method' do
      expect(subject).to respond_to(:stormy?).with(1).argument
    end
  end

end
