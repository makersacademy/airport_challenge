require 'airport'

describe Airport do

  let(:plane) { double :plane }

  describe '#land' do

    it 'lands a plane' do
    expect(subject).to respond_to(:land).with(1).argument
    end

    it 'does not land a plane when airport is full' do
    subject.land(plane)
    expect{subject.land(plane)}.to raise_error 'Airport is full!'
    end

    it 'does not land a plane when weather is stormy' do
      subject.weather
      if subject.good_weather == false
        expect{subject.land(plane)}.to raise_error 'Denied. Weather is stormy!'
      end
    end

  end

  describe '#take_off' do

    it 'takes off a plane' do
      expect(subject).to respond_to(:take_off).with(1).argument
    end

    it 'does not take off a plane when weather is stormy' do
      subject.weather
      if subject.good_weather == false
        expect{subject.take_off(plane)}.to raise_error 'Denied. Weather is stormy!'
      end
    end
  end

end
