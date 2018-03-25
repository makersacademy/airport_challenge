require 'airport'

describe Airport do

  it 'exists as a class' do
    expect(Airport).to be_instance_of Class
  end

  it 'should have an accessible collector to store plane objects' do
    expect(subject).to respond_to(:plane_array)
  end

  describe '#land' do
    it 'should exist as a method' do
      expect(subject).to respond_to(:land)
    end

    it 'should take one object (plane) as an argument' do
      expect(subject).to respond_to(:land).with(1).argument
    end

    it 'should store the argument in plane_array' do
      plane = double(plane)
      subject.land(plane)
      expect(subject.plane_array).to include(plane) 
    end

  end
end
