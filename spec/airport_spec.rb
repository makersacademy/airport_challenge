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
      plane = double(:plane)
      subject.land(plane)
      expect(subject.plane_array).to include(plane)
    end
  end

  describe '#take_off' do
    it 'should exist as a method' do
      expect(subject).to respond_to(:take_off)
    end

    it 'should take one object (plane) as an argument' do
      expect(subject).to respond_to(:land).with(1).argument
    end

    it 'removes a plane from the airport' do
      plane = double(:plane)
      subject.land(plane)
      subject.take_off(plane)
      expect(subject.plane_array).to_not include(plane)
    end
  end

  describe 'stormy' do
    it 'should exist as an accessible variable of the airport' do
    expect(subject).to respond_to(:stormy)
    end

    # it 'should respond with a '

  end

end
