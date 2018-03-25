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
      allow(subject).to receive(:weather).and_return("fine")
      plane = double(:plane)
      subject.land(plane)
      expect(subject.plane_array).to include(plane)
    end

    it 'should raise an error message if weather is stormy' do
      plane = double(:plane)
      allow(subject).to receive(:weather).and_return("stormy")
      expect{subject.land(plane)}.to raise_error("You can't land a plane in a storm!")
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
      allow(subject).to receive(:weather).and_return("fine")
      plane = double(:plane)
      subject.land(plane)
      subject.take_off(plane)
      expect(subject.plane_array).to_not include(plane)
    end

    it 'should raise an error message if weather is stormy' do
      allow(subject).to receive(:weather).and_return("fine")
      plane = double(:plane)
      subject.land(plane)
      allow(subject).to receive(:weather).and_return("stormy")
      expect{subject.take_off(plane)}.to raise_error("You can't fly a plane in a storm!")
    end

  end

  describe '#weather' do
    it 'should exist as a method' do
      expect(subject).to respond_to(:weather)
    end

    it 'should output "fine" or "stormy"' do
      expect(subject.weather).to eq("fine").or(eq("stormy"))
    end
  end


end
