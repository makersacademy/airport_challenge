require 'plane'
require 'airport'
require 'weather'

describe Airport do

  let(:weather) { double :weather }
    describe "::new" do
      it { should be_instance_of(Airport) }
    end

  describe '#initialize' do
    it 'sets capacity' do
      expect(subject.capacity).to be Airport::DEFAULT_CAPACITY
    end
  end

    describe 'land' do
      it { should respond_to(:land) }
      it 'instructs plane to land' do
        expect(subject.land(Plane.new))
      end

      it 'raises an error if airport is full' do
        allow(subject).to receive(:stormy_weather?).and_return false
        50.times { subject.land(Plane.new) }
        expect { subject.land(Plane.new) }.to raise_error("The airport is at maximum capacity")
      end

      it "stops plane to land if weather is stormy" do
        allow(subject).to receive(:stormy_weather?).and_return false
        50.times { subject.land(Plane.new) }
        expect { subject.land(Plane.new) }.to raise_error(RuntimeError)
      end
    end

    describe 'takeoff' do
    it { should respond_to(:takeoff) }
      it 'instructs plane to takeoff' do
        allow(subject).to receive(:stormy_weather?).and_return false
        plane = Plane.new
        subject.land(plane)
        expect { subject.takeoff(plane) }
      end

     it 'prvents the plane to take off if stormy' do
       allow(subject).to receive(:stormy_weather?).and_return(true)
       expect { subject.land(Plane.new) }.to raise_error("The flight is canceled due to stormy weather")
     end
    end
end
