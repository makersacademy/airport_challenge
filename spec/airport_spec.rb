require 'airport'

describe Airport do
  context "initialize" do
    
  end
  context '#land(plane)' do
    let(:plane) { Plane.new }
    it 'responds to a land method' do
      expect(subject).to respond_to(:land)
    end
    it 'accepts a landing plane' do
      subject.land(plane)  
      expect(subject.planes).to include(plane)
    end
    it 'prevents landing when airport is full' do
      subject.capacity.times { subject.land(plane) }
      expect {subject.land(plane) }.to raise_error("Airport full")
    end
  end
  context '#take_off' do
    it 'responds to a take off method' do
      expect(subject).to respond_to(:take_off)
    end
    it 'tells a plane to take off' do
      subject.land(Plane.new)
      expect(subject.take_off).to be_an_instance_of(Plane)
    end
  end
  context '#in?(plane)'
    it 'confirms a plane is no longer in the airport after take off' do
        subject.land(Plane.new)
        plane = subject.take_off
        expect(subject.in?(plane)).to eq false
    end
end
