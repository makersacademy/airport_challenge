require 'airport'

describe Airport do
  
  describe '#land' do
    it 'Can do so' do
      plane = Plane.new
      expect(subject.land(plane)).to eq([plane])
    end

    it 'Will not do so if the airport is full' do
      Airport::CAPACITY.times { subject.land(Plane.new) }
      expect { subject.land(Plane.new) }.to raise_error 'Airport full!'
    end

  end
  
  describe '#depart' do
    it 'Can instruct a stored plane to take off from the airport' do
      plane = Plane.new
      subject.land(plane)
      subject.depart(plane)
      expect(subject.stored_planes).to eq []
    end

    it 'Will not do so if there are no planes in the airport' do
      expect { subject.depart(Plane.new) }.to raise_error 'No planes'
    end

    it 'Will not take off if the plane is not in the airport' do
      subject.land(Plane.new)
      expect{subject.depart(Plane.new)}.to raise_error 'Plane not in airport'
    end
  end 

  it 'can have an airport capacity that can be overwritten as appropriate' do
    subject.adjust_capacity(1)
    subject.land(Plane.new)
    expect { subject.land(Plane.new) }.to raise_error 'Airport full!'
  end

  it 'has a default capacity' do
    Airport::CAPACITY.times { subject.land(Plane.new) }
    expect { subject.land(Plane.new) }.to raise_error 'Airport full!'
  end

  describe 'initialize' do
    it 'will be stormy weather and the plane will not land' do
      allow(subject).to receive(:set_weather).and_return('Stormy')
      expect { subject.land(Plane.new) }.to raise_error 'Cannot land - stormy weather!'
    end
  end


end
