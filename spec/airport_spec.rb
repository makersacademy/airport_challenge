require 'airport'
require 'plane'

describe Airport do

   describe 'initialize airport at set capacity' do
     it 'accepts an argument when created' do
       expect Airport.new()
     end
     it 'sets default capacity if no argument is given' do
       airport = Airport.new
       50.times{airport.land(Plane.new)}
       expect {airport.land(Plane.new)}.to raise_error("Airport full")
     end
   end

    describe '::new' do
      it {should be_instance_of(Airport)}
    end

   describe 'land' do
     it {should respond_to(:land).with (1)}
      it 'instructs plane to land' do
        expect(subject.land(Plane.new))
      end
     it 'raises an error if airport is full' do

       50.times{subject.land(Plane.new)}
       expect {subject.land(Plane.new)}.to raise_error("Airport full")
     end
    end

    describe 'takeoff' do
      it {should respond_to(:takeoff).with (1)}
      it 'instructs plane to takeoff' do

       plane  = Plane.new
     subject.land(plane)
       expect(subject.takeoff(plane)).to eq(plane)
      end
    end
  end
