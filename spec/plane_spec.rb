require 'plane'

describe Plane do

  describe 'plane status' do
    it { is_expected.to respond_to :landed }
  end

  describe '#in_flight' do
    it { is_expected.to respond_to :in_flight }

    it 'should not be landed when in flight' do
      subject.in_flight
      expect(subject.landed).to eq false
    end
  end

  describe '#touch_down' do
    it { is_expected.to respond_to :touch_down }

    it 'should be landed when it touches down' do
      subject.in_flight
      subject.touch_down
      expect(subject.landed).to eq true
    end

    it 'should not touch_down if it is already landed' do
      subject.landed = true
      expect{subject.touch_down}.to raise_error "This plane has landed elsewhere"
    end
  end

end