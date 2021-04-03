require 'airport'

describe Airport do

  before do
    @plane = Plane.new
  end

  it { is_expected.to be_instance_of Airport }

  it { is_expected.to respond_to(:land).with(1).argument }

  it 'lands a given plane' do
    expect(subject.land(@plane)).to eq([@plane])
  end

  it 'returns the landed planes' do
    subject.land(@plane)
    expect(subject.planes).to eq([@plane])
  end

  it { is_expected.to respond_to(:takeoff).with(1).argument }

  it 'instructs a specific plane to take off and removes it from the airport' do
    subject.land(@plane)
    subject.takeoff(@plane)
    expect(subject.planes).to eq([])
  end
  
  describe '#land' do

    it 'raises an error when airport is full' do
      Airport::DEFAULT_CAPACITY.times do 
        subject.land(Plane.new)
      end
      expect { subject.land(Plane.new) }.to raise_error 'Airport is full'
    end

    it 'raises an error when landing an already landed plane' do
      plane = Plane.new
      subject.land(plane)
      expect { subject.land(plane) }.to raise_error 'Plane has already landed'
    end
    
  end



end
