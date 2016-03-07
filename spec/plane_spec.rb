require 'plane'

describe Plane do

  subject(:plane) {described_class.new}
  let(:airport) { double :airport}

  describe 'land' do

    before(:each) {allow(airport).to receive_messages(full?:false, stormy?:false, plane_land:nil)}

    it 'plane lands' do
      subject.land(airport)
      expect(plane).to be_landed
    end
    it 'cannot land when airport is full' do
      allow(airport).to receive(:full?).and_return(true)
      message = 'Airport is full!'
      expect{plane.land(airport)}.to raise_error message
    end
    it 'cannot land when weather is stormy' do
      allow(airport).to receive(:stormy?).and_return(true)
      message = 'Too stormy to land!'
      expect{plane.land(airport)}.to raise_error message
    end
    it 'cannot land if it has already landed' do
      message = 'Plane has already landed!'
      plane.land(airport)
      expect{plane.land(airport)}.to raise_error message
    end
  end

  describe 'take_off' do

    before(:each) {allow(airport).to receive_messages(plane_take_off:nil, plane_land:nil, full?:false, empty?:false, stormy?:false)}

    it 'plane takes off' do
      subject.land(airport)
      subject.take_off(airport)
      expect(plane).to_not be_landed
    end
    it 'cannot take off when airport is empty' do
      subject.land(airport)
      allow(airport).to receive(:empty?).and_return(:true)
      message = 'Airport is empty!'
      expect{plane.take_off(airport)}.to raise_error message
    end
    it 'cannot take off when weather is stormy' do
      subject.land(airport)
      allow(airport).to receive(:stormy?).and_return(:true)
      message = 'Too stormy to take off!'
      expect{plane.take_off(airport)}.to raise_error message
    end
    it 'cannot take off if it is already flying' do
      message = 'Plane is still flying!'
      expect{plane.take_off(airport)}.to raise_error message
    end
  end

end
