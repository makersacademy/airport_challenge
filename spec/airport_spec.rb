require 'airport'

describe Airport do

  describe '#release' do

      it 'allows a plane to take off' do
        allow(subject).to receive(:stormy?).and_return(false)
        plane = double("plane", :flying => true, :land => false)
        subject.accept(plane)
        allow(plane).to receive(:flying).and_return(false)
        allow(plane).to receive(:takeoff).and_return(false)
        expect(subject.release(plane)).to eq plane
      end

      it 'should not release planes when the weather is stormy' do
        allow(subject).to receive(:stormy?).and_return(false)
        plane = double("plane", :flying => true, :land => false)
        subject.accept(plane)
        allow(plane).to receive(:flying).and_return(false)
        allow(plane).to receive(:takeoff).and_return(false)
        allow(subject).to receive(:stormy?).and_return(true)
        expect {subject.release(plane)}.to raise_error 'Weather is too stormy!'
      end

      it 'cannot take off planes when empty' do
        allow(subject).to receive(:stormy?).and_return(false)
        plane = double("plane", :flying => false)
        expect {subject.release(plane)}.to raise_error 'Airport empty!'
      end

      it 'should call takeoff on planes taking off' do
        allow(subject).to receive(:stormy?).and_return(false)
        plane = double("plane", :flying => true, :land => false)
        subject.accept(plane)
        allow(plane).to receive(:flying).and_return(false)
        expect(plane).to receive(:takeoff)
        subject.release(plane)
      end

      it 'should throw an error when releasing a flying plane' do
        allow(subject).to receive(:stormy?).and_return(false)
        plane = double("plane", :flying => true, :takeoff => false)
        expect {subject.release(plane)}.to raise_error 'Plane is already flying!'
      end

  end

  describe '#accept' do

    it 'allows planes to land' do
      allow(subject).to receive(:stormy?).and_return(false)
      plane = double("plane", :flying => true, :land => false)
      subject.accept(plane)
      expect(subject.planes[0]).to eq plane
    end

    it 'raises an error if the airport is full' do
      allow(subject).to receive(:stormy?).and_return(false)
      10.times {subject.accept(double("plane", :flying => true, :land => false))}
      expect {subject.accept(double("plane", :flying => true, :land => false))}.to raise_error 'Airport full!'
    end

    it 'should call land on landing planes' do
      allow(subject).to receive(:stormy?).and_return(false)
      plane = plane = double("plane", :flying => true)
      expect(plane).to receive(:land)
      subject.accept(plane)
    end

    it 'should throw an error when accepting a landed plane' do
      allow(subject).to receive(:stormy?).and_return(false)
      plane = double("plane", :flying => false, :land => false)
      expect {subject.accept(plane)}.to raise_error 'Plane has already landed!'
    end

    it 'should not accept planes that are in the airport' do
      allow(subject).to receive(:stormy?).and_return(false)
      plane = double("plane", :flying => true, :land => false)
      subject.accept(plane)
      allow(plane).to receive(:flying).and_return(true)
      expect {subject.accept(plane)}.to raise_error 'Plane is already in the airport!'
    end

    it 'should not accept planes when the weather is stormy' do
      allow(subject).to receive(:stormy?).and_return(false)
      plane = double("plane", :flying => true, :land => false)
      allow(subject).to receive(:stormy?).and_return(true)
      expect {subject.accept(plane)}.to raise_error 'Weather is too stormy!'
    end

  end


end
