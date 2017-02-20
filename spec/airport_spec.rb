require 'airport'

describe Airport do

  subject(:airport) { described_class.new }
  let(:land_plane) { double :plane, :status => 'landed' }
  let(:air_plane) { double :plane, :status => 'flying'}

# => Initialize tests
  describe '#initialize' do
      it 'should have a default capacity of 10' do
        expect(airport.capacity).to eq Airport::DEFAULT_CAPACITY
    end

    it 'should have the ability to set attributes: capacity' do
      expect(Airport.new(50)).to have_attributes(:capacity => 50)
    end
  end

# => Landing tests
  describe 'should not allow planes to land if full' do
    it 'an error should be raised when airport is full' do
      allow(airport).to receive(:full?) {true}
      allow(airport).to receive(:stormy?) {false}
      expect {airport.land_plane air_plane}.to raise_error "This airport is full, you cannot land here."
    end
  end

  describe 'will accept #land_plane' do
    it '#land_plane is successful' do
      allow(airport).to receive(:land_plane) {"The plane has landed safely"}
    end

    it 'instructs the plane to land and then has the plane' do
      plane = Plane.new
      allow(airport).to receive(:stormy?) {false}
      airport.land_plane(plane)
      expect(airport.planes).to include plane
    end
  end

# => Stop action if plane already landed Tested
    describe 'error raised' do
      it 'plane already landed' do
        plane = Plane.new
        allow(airport).to receive(:stormy?) {false}
        airport.land_plane(plane)
        expect{ airport.land_plane(plane) }.to raise_error("The plane cannot land again")
      end
    end

# => Take off tests
  describe 'will accept #take_off' do
    it 'should give a message for successful takeoff' do
      allow(airport).to receive(:take_off) {"The plane has taken off safely"}
    end

    it 'should raise an error when there are no more planes' do
      allow(airport).to receive(:stormy?) {false}
      expect {airport.take_off}.to raise_error("There are no planes to take off!")
    end
  end

# => Bad Weather Tests
    describe 'in bad weather' do
     it 'should not allow takeoff' do
       allow(airport).to receive(:stormy?) {true}
       expect { subject.take_off }.to raise_error "The plane cannot take off in a storm"
     end

     it 'should not allow landing' do
       allow(airport).to receive(:stormy?) {true}
       expect { subject.land_plane(Plane.new) }.to raise_error "The plane cannot land in a storm"
     end
    end

# => Change the capacity of my airport Tests
  describe '#change_airport_capacity' do
    it 'should make it possible to change airport capacity' do
      #airport = Airport.new
      airport.change_airport_capacity(30)
      expect(airport).to have_attributes(:capacity => 30)
    end
  end

end
