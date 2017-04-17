require 'plane'
require 'airport'
describe Airport do

    describe 'land' do
      it {should respond_to(:land).with (1)}
      it 'instructs plane to land' do
        expect(subject.land(Plane.new))
      end
      it 'raises an error if airport is full' do
        50.times{subject.land(Plane.new)}
        expect {subject.land(Plane.new)}.to raise_error("The airport is at maximum capacity")
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
