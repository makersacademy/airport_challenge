require 'airport'

describe Airport do

  context 'when created' do
    it 'has a control tower' do
      expect(subject).to respond_to :control_tower
    end

    it 'can park planes' do
      subject.park :plane
      expect(subject.planes).to eq([:plane])
    end

    it 'has a standard capacity of 30' do
      expect(subject.capacity).to eq 30
    end

    it 'can have a variable capacity' do
      airport = Airport.new capacity: 200
      expect(airport.capacity).to eq 200
    end

    it 'cannot unpark a plane that is not in the airport' do
      expect { subject.unpark :plane }.to raise_error
    end
  end

  context 'when it has plane stored inside' do
    it 'can unpark planes' do
      subject.park :plane
      subject.unpark :plane
      expect(subject.planes).to eq([])
    end

    it 'cannot park the same plane twice' do
      subject.park :plane
      expect { subject.park :plane }.to raise_error
    end

    it 'cannot park more than his capacity' do
      (1..30).each { |plane| subject.park plane }
      expect { subject.park :plane }.to raise_error
    end

    it 'can calculate available room after parking planes' do
      (1..15).each { |plane| subject.park plane }
      expect(subject.available_room).to eq 15
    end

    it 'can calculate available room after unparking planes' do
      (1..15).each { |plane| subject.park plane }
      (1..5).each { |plane| subject.unpark plane }
      expect(subject.available_room).to eq 20
    end
  end
end
