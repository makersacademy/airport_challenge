require 'airport'

describe Airport do

  describe '#initialize' do
      it 'should have a default capacity of 10 if no other capacity is set' do
        expect(subject.capacity).to eq Airport::DEFAULT_CAPACITY
    end

    it 'should have ability to set capacity of airports' do
      new_airport = Airport.new(50)
      50.times {new_airport.land_plane Plane.new}
      expect { new_airport.land_plane Plane.new}.to raise_error "This airport is full, you cannot land here."
    end
  end

  describe 'should respond to default capacity and not allow planes to land if full' do
    it "raises an error when the airport is full at (DEFAULT_CAPACITY)" do
    Airport::DEFAULT_CAPACITY.times { subject.land_plane Plane.new }
    expect {subject.land_plane Plane.new}.to raise_error "This airport is full, you cannot land here."
    end
  end

  describe 'Planes can land in the airport' do
    #expect airport to accept land plane and return plane/true
    it 'responds to #land_plane and returns landed plane' do
      new_plane = Plane.new
      expect(subject.land_plane(new_plane)).to eq "The plane has landed safely"
    end
  end

    describe 'planes can take off from the airpot' do
      it 'responds to #take_off and returns true' do
        new_plane = Plane.new
        subject.land_plane(new_plane)
        expect(subject.take_off).to eq "The plane has taken off safely"
      end

      it 'raises an error when there are no more planes to take off' do
        expect {subject.take_off}.to raise_error("There are no planes to take off!")
      end
    end



end
