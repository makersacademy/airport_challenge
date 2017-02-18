require 'airport'

describe Airport do

# => Initialize tests
  describe '#initialize' do
      it 'should have a default capacity of 10' do
        expect(subject.capacity).to eq Airport::DEFAULT_CAPACITY
    end

    it 'should have the ability to set capacity and raise error when airport is full at this capacity' do
      new_airport = Airport.new(50)
      50.times {new_airport.permission_to_land Plane.new}
      expect { new_airport.permission_to_land Plane.new}.to raise_error "This airport is full, you cannot land here."
    end
  end

# => Landing tests
  describe 'should not allow planes to land if full' do
    it 'an error should be raised when airport is full at DEFAULT_CAPACITY' do
      Airport::DEFAULT_CAPACITY.times { subject.permission_to_land Plane.new }
      expect {subject.permission_to_land Plane.new}.to raise_error "This airport is full, you cannot land here."
    end
  end

# => Doubles Test for landing plane
  describe 'will accept #land_planes' do
  let(:plane) {double :plane}
    it '#land_plane is successful' do
      allow(subject).to receive(:land_plane) {"The plane has landed safely"}
    end
  end

# => Take off tests
  describe 'will accept #take_off' do
  let(:plane) {double :plane}
    it 'should give a message for successful takeoff' do
      allow(subject).to receive(:take_off) {"The plane has taken off safely"}
    end

    it 'should raise an error when there are no more planes' do
      expect {subject.permission_to_take_off}.to raise_error("There are no planes to take off!")
    end
  end

# => Bad Weather Tests
    describe 'in bad weather' do
     it 'should not allow takeoff' do
       subject.stub(:rand_weather).and_return(9)
       expect { subject.take_off }.to raise_error "The plane cannot take off in a storm"
     end

     it 'should not allow landing' do
       subject.stub(:rand_weather).and_return(9)
       expect { subject.land_plane(Plane.new) }.to raise_error "The plane cannot land in a storm"
     end
    end

# => Change the capacity of my airport Tests
  describe '#change_airport_capacity' do
    it 'should make it possible to change airport capacity' do
      #airport = Airport.new
      subject.change_airport_capacity(30)
      expect(subject).to have_attributes(:capacity => 30)
    end
  end

end
