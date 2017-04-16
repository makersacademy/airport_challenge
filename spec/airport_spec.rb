require 'airport'
require 'airplane'
require 'weather'

describe Airport do

  describe '#land' do
    it 'should land airplane at airport' do
      allow_any_instance_of(Weather).to receive(:stormy?) { false }
      plane = subject.runways[-1]
      subject.take_off(plane)
      subject.land(plane)
      expect(subject.runways.include? plane).to eq true
    end

    it 'should not land at airport when #stormy?' do
      message = "No taking off or landing allowed while weather is stormy."
      allow_any_instance_of(Weather).to receive(:stormy?) { false }
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
  end

end
