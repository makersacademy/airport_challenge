require 'airport'
require 'airplane'
require 'weather'

describe Airport do

  describe '#land' do
    it 'should land airplane at airport' do
      allow_any_instance_of(Weather).to receive(:stormy?) { nil }
      plane = subject.runways[-1]
      subject.take_off(plane)
      subject.land(plane)
      expect(subject.runways.include? plane).to eq true
    end

    it 'should land several airplanes at airport' do
      allow_any_instance_of(Weather).to receive(:stormy?) { nil }
      10.times { subject.take_off(subject.runways[-1]) }
      10.times { subject.land(Airplane.new) }
      expect(subject.runways.count).to eq 10
    end

    it 'should not land at airport when #stormy?' do
      message = "No taking off or landing allowed while weather is stormy."
      allow_any_instance_of(Weather).to receive(:stormy?) { nil }
      plane = subject.runways[-1]
      subject.take_off(plane)
      allow_any_instance_of(Weather).to receive(:stormy?) { raise message }
      expect { subject.land(plane) }.to raise_error message
    end
  end

  describe '#landed?' do
    it 'should confirm airplane landed' do
      allow_any_instance_of(Weather).to receive(:stormy?) { nil }
      plane = subject.runways[-1]
      subject.take_off(plane)
      subject.land(plane)
      expect(subject.landed?(plane)).to eq true
    end

    it 'should tell when airplane is not on land' do
      allow_any_instance_of(Weather).to receive(:stormy?) { nil }
      plane = subject.runways[-1]
      subject.take_off(plane)
      expect(subject.landed?(plane)).to eq false
    end
  end

  describe '#take_off' do
    it { should respond_to(:take_off) }

    it 'should make airplane leave airport' do
      allow_any_instance_of(Weather).to receive(:stormy?) { nil }
      plane = subject.runways[-1]
      subject.take_off(plane)
      expect(subject.runways.include? plane).to_not eq true
    end

    it 'should not #take_off when weather is #stormy?' do
      message = "No taking off or landing allowed while weather is stormy."
      allow_any_instance_of(Weather).to receive(:stormy?) { raise message }
      plane = subject.runways[-1]
      expect { subject.take_off(plane) }.to raise_error message
    end

    it 'should make several airplanes leave airport' do
      allow_any_instance_of(Weather).to receive(:stormy?) { nil }
      10.times { subject.take_off(subject.runways[-1]) }
      expect(subject.runways.count).to eq 0
    end
  end

  describe '#full' do
    it 'should return error when trying to land on full airport' do
      allow_any_instance_of(Weather).to receive(:stormy?) { nil }
      expect { subject.land(Airplane.new) }.to raise_error "Airport is full."
    end
  end

  describe '#empty' do
    it 'should return error when trying to take off from empty airport' do
      allow_any_instance_of(Weather).to receive(:stormy?) { nil }
      plane = subject.runways[-1]
      10.times { subject.take_off(subject.runways[-1]) }
      expect { subject.take_off(plane) }.to raise_error "Airport is empty."
    end
  end

  describe '#flying' do
    it 'should return true when plane is flying' do
      allow_any_instance_of(Weather).to receive(:stormy?) { nil }
      plane = subject.runways[-1]
      subject.take_off(plane)
      expect(subject.flying?(plane)).to eq true
    end

    it 'should return false when plane is landed' do
      allow_any_instance_of(Weather).to receive(:stormy?) { nil }
      plane = subject.runways[-1]
      expect(subject.flying?(plane)).to eq false
    end
  end

end
