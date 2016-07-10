require 'airport'

describe Airport do

  describe '#land_plane' do
      it 'lands a plane' do
      plane = Airplane.new
      expect(subject.land(plane)).to eq [plane]
    end
  end

    describe '#take_off' do
      it 'instructs the plane to take off from the Airport' do
        plane = Airplane.new
        subject.land(plane)
        expect(subject.take_off).to eq plane

      end
    end
    describe '#capacity' do
       it 'prevents planes landing if there is no room' do
       Airport::DEFAULT_CAPACITY.times{subject.land(Airplane.new)}
       expect {subject.land(Airplane.new)}.to raise_error "Airport full"
     end
   end
   it 'has a default capacity' do
     expect(subject.capacity).to eq Airport::DEFAULT_CAPACITY
  end
    it 'can change its capacity depending on the user' do
      airport = Airport.new(50)
      50.times { airport.land Airplane.new }
      expect{ airport.land Airplane.new }.to raise_error 'Airport full'
end
end
