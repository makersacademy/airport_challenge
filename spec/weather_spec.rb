require 'weather'
require 'airport'
require 'airplane'

describe Weather do
  describe '#stormy?' do
    it 'should raise error when weather is #stormy?' do
      message = "No taking off or landing allowed while weather is stormy."
      allow_any_instance_of(Weather).to receive(:stormy?) { raise message }
      expect { subject.stormy? }.to raise_error message
    end

    it 'should not raise error when weather is not #stormy?' do
      allow_any_instance_of(Weather).to receive(:stormy?) { nil }
      expect(subject.stormy?).to eq nil
    end
  end
end
