require 'airport'

describe Airport do

  subject(:airport) {described_class.new}
  let(:plane) {double :plane}

  before do
    allow(plane).to receive(:flying).and_return(true)
    allow(plane).to receive(:land).and_return(false)
    allow(airport).to receive(:stormy?).and_return(false)
  end

  describe '#release' do

    before do
      airport.accept(plane)
      allow(plane).to receive(:flying).and_return(false)
      allow(plane).to receive(:takeoff).and_return(false)
    end

    context "Allowing a plane to take off" do

      it 'allows a plane to take off' do
        expect(airport.release(plane)).to eq plane
      end

      it 'should call takeoff on planes taking off' do
        expect(plane).to receive(:takeoff)
        airport.release(plane)
      end

      end

      context "Calling errors due to plane behaviour" do

      it 'cannot take off planes when empty' do
        airport.release(plane)
        expect {airport.release(plane)}.to raise_error 'Airport empty!'
      end

      it 'should throw an error when releasing a flying plane' do
        plane = double("plane", :flying => true, :takeoff => false)
        expect {airport.release(plane)}.to raise_error 'Plane is already flying!'
      end

      end

      context "Calling error due to stormy weather" do

      it 'should not release planes when the weather is stormy' do
        allow(airport).to receive(:stormy?).and_return(true)
        expect {airport.release(plane)}.to raise_error 'Weather is too stormy!'
      end

    end

  end

  describe '#accept' do

    context "when allowing a plane to land" do

    it 'allows planes to land' do
      airport.accept(plane)
      expect(airport.planes[0]).to eq plane
    end

    it 'should call land on landing planes' do
      expect(plane).to receive(:land)
      airport.accept(plane)
    end

    end

    context "Expecting errors due to plane behaviour" do

    it 'raises an error if the airport is full' do
      10.times {airport.accept(double("plane", :flying => true, :land => false))}
      expect {airport.accept(plane)}.to raise_error 'Airport full!'
    end

    it 'should throw an error when accepting a landed plane' do
      plane = double("plane", :flying => false, :land => false)
      expect {airport.accept(plane)}.to raise_error 'Plane has already landed!'
    end

    it 'should not accept planes that are in the airport' do
      airport.accept(plane)
      allow(plane).to receive(:flying).and_return(true)
      expect {airport.accept(plane)}.to raise_error 'Plane is already in the airport!'
    end

    end

    context "expecting error due to stormy weather" do

    it 'should not accept planes when the weather is stormy' do
      allow(airport).to receive(:stormy?).and_return(true)
      expect {airport.accept(plane)}.to raise_error 'Weather is too stormy!'
    end

    end

  end


end
