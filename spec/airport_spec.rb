require 'airport'

describe Airport do
  let(:plane) { double(:plane, :landed? => false, :landing => true, :taking_off => true) }
  let(:plane_second) { double(:plane, :landed? => false, :landing => true) }

  before(:each) do
    subject.storm = false
  end

  describe '#initialize' do
    it 'Creating an Airport should set the default capacity' do
      expect(subject.capacity).to eq Airport::DEFAULT_CAPACITY
    end

    it 'It should be possible to update an Airport capacity' do
      subject.capacity = 5
      expect(subject.capacity).to eq 5
    end
  end

  describe '#land' do
    it 'A landed plane should be visible' do
      subject.land(plane)
      expect(subject.apron).to include plane
    end

    it 'Raise an error if the apron is full' do
      subject.capacity.times { subject.land(plane) }
      message = 'The airport is full!'
      expect { subject.land(plane) }.to raise_error(message)
    end

    it 'In stormy weather raise an error' do
      subject.storm = true
      message = 'The storm prevent the landing!'
      expect { subject.land(plane) }.to raise_error(message)
    end

    it "A landed plane can't land again" do
      allow(plane).to receive(:landed?) { true }
      message = 'This plane is currently landed!'
      expect { subject.land(plane) }.to raise_error(message)
    end
  end

  describe '#takeoff' do
    it 'After takeoff the plane should not be in the apron' do
      subject.land(plane)
      subject.takeoff(plane)
      expect(subject.apron).to be_empty
    end

    it 'After takeoff the other planes in the apron should still exist' do
      subject.land(plane)
      subject.land(plane_second)
      subject.takeoff(plane)
      expect(subject.apron).to be_any
    end

    it 'Raise an error if the desired plane is not in the apron' do
      message = 'This plane is not in the apron!'
      expect { subject.takeoff(plane) }.to raise_error(message)
    end

    it 'In stormy weather raise an error' do
      subject.land(plane)
      subject.storm = true
      message = 'The storm prevent the takeoff!'
      expect { subject.takeoff(plane) }.to raise_error(message)
    end

    it 'After take off the plane should not have a landed status' do
      aereo = Plane.new("WWW")
      subject.land(aereo)
      subject.takeoff(aereo)
      expect(aereo).not_to be_landed
    end
  end
end
