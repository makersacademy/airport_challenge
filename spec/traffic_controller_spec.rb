require 'traffic_controller'

describe Controller do
  describe 'class existance' do
    it 'can create an instance of the class' do
      expect(subject).to be_a(Controller)
    end
  end

  describe 'instruct takeoff' do
    it 'controller instructs for takeoff only a plane with fly status true' do
      message = "The plane is already flying"
      expect {subject.instruct_takeoff(Plane.new)}.to raise_error(message)
    end
    it 'controller releases a plane and changes it fly status to true' do
      plane = Plane.new(false)
      expect(subject.instruct_takeoff(plane)).to eq(true)
      expect(plane.status).to eq(true)
    end
  end

  describe 'instruct landing' do
    it 'controller instructs for landing only a plane with fly status flase' do
      message = "The plane has already landed"
      expect {subject.instruct_landing(Plane.new(false))}.to raise_error(message)
    end
    it 'controller accepts a plane and changes it fly status to false' do
      plane = Plane.new
      expect(subject.instruct_landing(plane)).to eq(true)
      expect(plane.status).to eq(false)
    end
  end
end
