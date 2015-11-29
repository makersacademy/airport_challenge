require 'airport.rb'

describe Airport do
  describe '#land' do

    it { is_expected.to respond_to(:land).with(1).argument }

    it 'can land a plane' do
      plane = double(:plane)
      allow(plane).to receive_messages(:landing => false)
      allow(subject).to receive_messages(:stormy? => false)
      subject.land(plane)
      expect(subject.planes).to eq [plane]
    end

    it 'prevents landing in stormy conditions' do
      allow(subject).to receive_messages(:stormy => true)
      expect{subject.land(double(:plane))}.to raise_error
    end

    it 'prevents landing when airport is full' do
      plane = double(:plane)
      allow(plane).to receive_messages(:landing => false)
      10.times do
        subject.land(plane)
      end
      expect{subject.land(plane)}.to raise_error
    end
  end

  describe '#take_off' do

    it { is_expected.to respond_to(:take_off).with(1).argument }

    it 'takes off from the airport' do
      plane = double(:plane)
      allow(plane).to receive_messages(:landing => false, :taking_off => true)
      allow(subject).to receive_messages(:stormy? => false)
      subject.land(plane)
      subject.take_off(plane)
      expect(subject.planes).to eq []
    end

    it 'prevents take off in stormy conditions' do
      plane = double(:plane)
      allow(subject).to receive_messages(:stormy? => true)
      expect{subject.take_off(plane)}.to raise_error
    end
  end


end
