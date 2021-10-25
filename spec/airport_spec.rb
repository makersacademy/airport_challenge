require_relative '../lib/airport'

describe Airport do
  
  describe '#land_plane' do
    before do
      weather = Weather.new
      allow(weather).to receive(:is_stormy?).and_return true
    end
    it 'should respond to method land_plane' do
      expect(subject).to respond_to (:land_plane)
    end
    
    it 'method land_plane should store the plane at the airport' do
      plane = Plane.new(true)
      array = []
      expect(subject.land_plane(plane)).to eq array.push(plane)
    end
    it 'Should throw error if at max capacity' do
      subject.capacity.times { subject.land_plane(Plane.new(true)) }
      expect{subject.land_plane(Plane.new(true))}.to raise_error 'The airport is full'
    end 
    it 'Shoud throw error if plane is already at an airport' do
      plane = Plane.new(false)
      expect{subject.land_plane(plane)}.to raise_error 'Plane already at an airport'
    end
    it 'should block a plane landing if it is stormy' do
      plane = Plane.new(true)
      message = 'Not able to do this action due to the weather'
      expect { subject.land_plane(plane) }.to raise_error message
    end
  end

  describe 'takeoff' do
    it 'should respond to method takeoff' do
      expect(subject).to respond_to (:takeoff)
    end
    it 'comfirm plane is no longer in airport' do
      plane = Plane.new
      subject.planes << plane
      subject.takeoff(plane)
      expect(subject.planes).not_to include plane
    end
    it 'should fail if airport is already in the air' do
      plane = Plane.new(true)
      expect{subject.takeoff(plane)}.to raise_error 'Plane already in the air'
    end
  end
end