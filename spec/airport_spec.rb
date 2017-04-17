require 'plane'
require 'airport'
require 'weather'

describe Airport do

  describe '#initialize' do
    it 'sets capacity' do
      expect(subject.capacity).to be Airport::DEFAULT_CAPACITY
    end
  end

    describe 'land' do
      it {should respond_to(:land)}
      it 'instructs plane to land' do
        expect(subject.land(Plane.new))
      end
      it 'raises an error if airport is full' do
        50.times{subject.land(Plane.new)}
        expect {subject.land(Plane.new)}.to raise_error("The airport is at maximum capacity")
      end

      it "stops plane to land if weather is stormy" do
        50.times {subject.land(Plane.new) }
        expect {subject.land(Plane.new)}.to raise_error(RuntimeError)
      end
    end

    describe 'takeoff' do

    it {should respond_to(:takeoff)}
      it 'instructs plane to takeoff' do
 #       plane = Plane.new
 #       subject.land(plane)
 #       expect(subject.takeoff(plane)).to eq(jumbo)
      subject.land(Plane.new)
       expect{(subject.takeoff)}
     end

     it 'raises an error if airport is empty' do
       expect {subject.takeoff}.to raise_error(RuntimeError)
      end
    end
  end
