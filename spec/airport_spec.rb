require 'airport'

describe Airport do

  let(:plane) { Plane.new }

  context "landing" do
  	
    it { is_expected.to respond_to(:to_land).with(1).argument}
    
    it "the number of planes is increasing when plane lands" do
      allow(subject).to receive(:weather).and_return(5)
      subject.to_land(plane)
      expect(subject.planes.count).to eq(1)
    end

    it 'raises an error when an airport is full' do
      allow(subject).to receive(:weather).and_return(5)
      subject.capacity.times { subject.to_land plane }
      expect { subject.to_land plane }.to raise_error 'Airport is full'
    end

    it "Raise an error when a plane is landing in a stormy weather" do
      allow(subject).to receive(:weather).and_return(2)
      expect {subject.to_land(plane)}.to raise_error "Plane can't land, because of the stormy weather"
   end
  end

  context 'take off' do

    it { is_expected.to respond_to(:take_off).with(1).argument}

    it "the number of planes is decreasing when plane take off" do
      allow(subject).to receive(:weather).and_return(5)
      subject.to_land(plane)
      subject.take_off(plane)
      expect(subject.planes.count).to eq(0)
    end

    it "Raise an error when a plane is taking off in a stormy weather" do
      allow(subject).to receive(:weather).and_return(2)
      expect { subject.take_off(plane) }.to raise_error "Can't take off in stormy weather"
    end
  end
end
