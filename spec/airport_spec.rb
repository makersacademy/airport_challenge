require 'airport'

describe Airport do


  describe "Take off" do
 
    it 'Instructs a plane to take off' do
       expect(subject).to respond_to(:take_off)
    end

    it 'Does not allow a plane to take off when stormy' do
      allow(subject).to receive(:weather).and_return("stormy")
      expect{subject.take_off(Plane.new)}.to raise_error("There is a storm, the plane cannot land!")
    end
  end

    describe "Landing" do

    it 'Instructs a plane to land' do
      expect(subject).to respond_to(:land_plane).with(1).argument
    end

    it 'Does not allow a plane to land during a storm' do
      allow(subject).to receive(:weather).and_return("stormy")
      expect{subject.land_plane Plane.new}.to raise_error("There is a storm, the plane cannot land!")
    end

    it 'Traffic control does not allow a plane to land at full capacity' do
      allow(subject).to receive(:weather).and_return("sunny")
      subject.capacity.times {subject.land_plane(Plane.new)}
      expect{subject.land_plane Plane.new}.to raise_error 'Airport at full capacity'
    end

  end
end


    
