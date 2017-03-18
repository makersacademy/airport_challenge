require 'airport'

describe Airport do

  describe '#release' do

      it 'allows a plane to take off' do
        plane = double("plane", :flying => true, :land => false)
        subject.accept(plane)
        allow(plane).to receive(:flying).and_return(false)
        allow(plane).to receive(:takeoff).and_return(false)
        expect(subject.release(plane)).to eq plane
      end

      it 'cannot take off planes when empty' do
        plane = double("plane", :flying => false)
        expect {subject.release(plane)}.to raise_error 'Airport empty!'
      end

      # Redundant test case, as testing integration between classes reserved for feature testing for now..?
      #it 'should call takeoff on planes' do
      #  plane = double("plane", :flying => true, :land => false)
      #  subject.accept(plane)
      #  subject.release(plane)
      #  expect(plane.flying).to eq true
      #end

      it 'should throw an error when releasing a flying plane' do
        plane = double("plane", :flying => true, :takeoff => false)
        expect {subject.release(plane)}.to raise_error 'Plane is already flying!'
      end

  end

  describe '#accept' do

    it 'allows planes to land' do
      plane = double("plane", :flying => true, :land => false)
      subject.accept(plane)
      expect(subject.planes[0]).to eq plane
    end

    it 'raises an error if the airport is full' do
      10.times {subject.accept(double("plane", :flying => true, :land => false))}
      expect {subject.accept(double("plane", :flying => true, :land => false))}.to raise_error 'Airport full!'
    end

    # Redundant test case, as integraton between classes reserved for feature testing for now...?
    #it 'should set landing planes to landed' do
    #  plane = Plane.new
    #  subject.accept(plane)
    #  expect(plane.flying).to eq false
    #end

    it 'should throw an error when accepting a landed plane' do
      plane = double("plane", :flying => false, :land => false)
      expect {subject.accept(plane)}.to raise_error 'Plane has already landed!'
    end

    it 'should not accept planes that are in the airport' do
      plane = double("plane", :flying => true, :land => false)
      subject.accept(plane)
      allow(plane).to receive(:flying).and_return(true)
      expect {subject.accept(plane)}.to raise_error 'Plane is already in the airport!'
    end

  end


end
