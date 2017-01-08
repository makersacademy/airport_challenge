require 'traffic_controller'

describe Controller do
  describe 'class existance' do
    it 'can create an instance of the class' do
      expect(subject).to be_a(Controller)
    end
  end

  describe 'instruct_takeoff' do
    it 'controller instructs for takeoff only a plane with fly status true' do
      message = "The plane is already flying"
      expect {subject.instruct_takeoff(Plane.new)}.to raise_error(message)
    end
    it 'controller releases a plane and changes it fly status to true' do
      plane = Plane.new(false)
      expect(subject.instruct_takeoff(plane)).to eq(true)
      expect(plane.status).to eq(true)
    end
    it 'prevent takeoff when the weather is stormy' do
      plane = Plane.new(false)
      expect(subject.instruct_takeoff(plane,true)).to eq(false)
      expect(plane.status).to eq(false)
    end
  end

  describe 'instruct_landing' do
    it 'controller instructs for landing only a plane with fly status flase' do
      message = "The plane has already landed"
      expect {subject.instruct_landing(Plane.new(false))}.to raise_error(message)
    end
    it 'controller accepts a plane and changes it fly status to false' do
      plane = Plane.new
      expect(subject.instruct_landing(plane)).to eq(true)
      expect(plane.status).to eq(false)
    end
    it 'prevent landing when the weather is stormy' do
      plane = Plane.new
      expect(subject.instruct_landing(plane,true)).to eq(false)
      expect(plane.status).to eq(true)
    end
  end

  describe 'block_takeoff_if_stormy' do
    it 'returns true if the weather is stromy' do
      expect(subject.block_takeoff_if_stormy(true)).to eq(true)
    end
    it 'returns false if the weather is not stormy' do
      expect(subject.block_takeoff_if_stormy(false)).to eq(false)
    end
  end

  describe 'block_landing_if_stormy' do
    it 'returns true if the weather is stromy' do
      expect(subject.block_landing_if_stormy(true)).to eq(true)
    end
    it 'returns false if the weather is not stormy' do
      expect(subject.block_landing_if_stormy(false)).to eq(false)
    end
  end

  describe 'stormy random function' do

  end
end
