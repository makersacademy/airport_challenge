require 'airport'

describe Airport do

# => Initialize tests
  describe '#initialize' do
      it 'should have a default capacity of 10 if no other capacity is set' do
        expect(subject.capacity).to eq Airport::DEFAULT_CAPACITY
    end

    it 'should have ability to set capacity of airports' do
      new_airport = Airport.new(50)
      50.times {new_airport.permission_to_land Plane.new}
      expect { new_airport.permission_to_land Plane.new}.to raise_error "This airport is full, you cannot land here."
    end
  end

# => Landing tests
  describe 'should respond to default capacity and not allow planes to land if full' do
    it "raises an error when the airport is full at (DEFAULT_CAPACITY)" do
    Airport::DEFAULT_CAPACITY.times { subject.permission_to_land Plane.new }
    expect {subject.permission_to_land Plane.new}.to raise_error "This airport is full, you cannot land here."
    end
  end

  describe 'planes can land in the airport' do
    it 'responds to #land_plane and returns string' do
      expect(subject.permission_to_land(Plane.new)).to eq "The plane has landed safely"
    end
  end

# => Take off tests
    describe 'planes can take off from the airpot' do
      it 'responds to #take_off and returns a string' do
        subject.permission_to_land(Plane.new)
        expect(subject.permission_to_take_off).to eq "The plane has taken off safely"
      end

      it 'raises an error when there are no more planes to take off' do
        expect {subject.permission_to_take_off}.to raise_error("There are no planes to take off!")
      end
    end

# => Bad Weather Tests
    describe 'bad weather stops planes: ' do
     it 'a plane is unable to take off when there is a storm' do
       subject.stub(:rand_weather).and_return(9)
       expect { subject.take_off }.to raise_error "The plane cannot take off in a storm"
     end

     it 'a plane is unable to land when there is a storm' do
       subject.stub(:rand_weather).and_return(9)
       expect { subject.land_plane(Plane.new) }.to raise_error "The plane cannot land in a storm"
     end
    end


end
