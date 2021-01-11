require "plane"
require "airport"
require "weather"

describe Airport do

  describe '#land' do
    context 'when not stormy' do

      before do
        allow(subject).to receive(:stormy?).and_return false
      end

      it 'raises an error when plane has already landed' do
        plane = Plane.new
        subject.land(plane)
        expect { subject.land(plane) }.to raise_error "Plane has already landed"
      end
    end

    context 'when it is stormy' do

      before do
        allow(subject).to receive(:stormy?).and_return true
      end

      it 'prevents a plane from landing when stormy' do
        expect { subject.land(Plane.new) }.to raise_error "No landings allowed due to bad weather"
      end
    end
  end

  describe '#takeoff' do
    it "should raise an error when we call takeoff but the plane is flying" do
      allow(subject).to receive(:stormy?).and_return false
      plane = Plane.new
      expect { subject.takeoff(plane) }.to raise_error "This plane has not landed"
    end
  end

  context 'when not stormy' do
    before do
      allow(subject).to receive(:stormy?).and_return false
    end
    describe '#present?' do
      it 'should return true or false if airplanes have landed' do
        plane = Plane.new
        expect(subject.present?(plane)).to eq false
        plane = Plane.new
        subject.land(plane)
        expect(subject.present?(plane)).to eq true
      end
    end


    context 'checking if the airport is full' do
      it 'should return true or false if full' do
        expect(subject.send(:full?)).to eq false
        subject.capacity.times { subject.land(Plane.new) }
        expect(subject.send(:full?)).to eq true
      end
    end
  end
end
