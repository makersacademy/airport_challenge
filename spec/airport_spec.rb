require 'airport'
require 'plane'

describe Airport do

  describe 'initialization' do
    subject{ Airport.new}
    let(:plane) {Plane.new}
    it 'defaults capacity' do
      Airport::DEFAULT_CAPACITY.times do
        subject.land(plane)
      end
      expect{subject.land(plane)}.to raise_error "Airport full"
    end
  end


  describe "#land" do
    it 'A plane lands at the airport' do
      plane = Plane.new
      subject.land(plane)
      expect(subject.planes).to eq [plane]
    end
  end

  describe "#take_off" do
    it 'A plane takes off at the airport' do
      plane = Plane.new
      subject.land(plane)
      subject.take_off(plane)
      expect(subject.planes).to eq []
    end

    it 'raise an error when there are no planes to take off' do
      plane = Plane.new
      subject.land(plane)
      subject.take_off(plane)
      expect{subject.take_off(plane)}.to raise_error "There are no planes to take off"
    end
  end


end
