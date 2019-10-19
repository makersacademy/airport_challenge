require 'airport'

describe Airport do

  it 'lands a plane' do
    plane = Plane.new
    subject.land(plane)
    expect(subject.plane.length).to eq 1
  end

  describe '#take_off' do
    it 'plane takes off' do
      plane1 = Plane.new
      subject.take_off(plane1)
      expect(subject.plane.include?(plane1)).to eq false
    end
    it 'confirms that plane is no longer in airport' do
      plane1 = Plane.new
      expect { subject.take_off(plane1) }.to output("#{plane1} no longer in airport\n").to_stdout
    end
  end

end
