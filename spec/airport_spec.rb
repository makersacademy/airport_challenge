require 'airport.rb'

RSpec.describe Airport do

  describe "Capacity var" do
    it { is_expected.to respond_to(:capacity) }

    it 'checks to see if capacity can be changed' do
      truetest = rand(1..100)
      airport = Airport.new(truetest)
      allow(airport).to receive(:stormy?) { false }
      truetest.times { airport.land(Plane.new) }
      expect(airport.capacity).to eq truetest
    end
  end

  describe "Land function" do
    it 'checks to see if the plane has landed' do
      plane = Plane.new
      allow(subject).to receive(:stormy?) { false }
      expect(subject.land(plane)).to eq plane
    end

    it 'checks to see if it is too stormy to land' do
      plane = Plane.new
      allow(subject).to receive(:stormy?) { true }
      expect { subject.land(plane) }.to raise_error 'The weather is too stormy to land.'
    end
  end

  describe "Takeoff function" do
    it 'checks to see if the plane has taken off' do
      allow(subject).to receive(:stormy?) { false }
      subject.land(Plane.new)
      plane = subject.takeoff
      expect(plane).to be_working
    end

    it 'checks to see if it is too stormy to takeoff' do
      plane = Plane.new
      allow(subject).to receive(:stormy?) { false }
      subject.land(plane)
      allow(subject).to receive(:stormy?) { true }
      expect { subject.takeoff }.to raise_error 'The weather is too stormy to take off.'
    end
  end

  describe "stormy? function" do
    it { is_expected.to respond_to(:stormy?) }
      it 'return true or false' do
        allow(subject).to receive(:rand).and_return(1)
        expect(subject.stormy?).to be true
      end

  end
end
