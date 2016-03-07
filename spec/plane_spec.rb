require 'plane'

describe Plane do

  subject(:plane) {described_class.new}
  let(:airport) { double :airport}

  describe 'land' do

    before(:each) {allow(airport).to receive(:plane_land)}

    it 'plane lands' do
      allow(airport).to receive_messages(full?:false, stormy?:false)
      subject.land(airport)
      expect(plane).to be_landed
    end
    it 'cannot land when airport is full' do
      allow(airport).to receive_messages(full?:true, stormy?:false)
      message = 'Airport is full!'
      expect{plane.land(airport)}.to raise_error message
    end
    it 'cannot land when weather is stormy' do
      allow(airport).to receive_messages(full?:false, stormy?:true)
      message = 'Too stormy to land!'
      expect{plane.land(airport)}.to raise_error message
    end
    it 'cannot land if it has already landed' do
      allow(airport).to receive_messages(full?:false, stormy?:false)
      message = 'Plane has already landed!'
      plane.land(airport)
      expect{plane.land(airport)}.to raise_error message
    end
  end

  describe 'take_off' do

    before(:each) {allow(airport).to receive_messages(plane_take_off:nil, plane_land:nil)}

    it 'plane takes off' do
      allow(airport).to receive_messages(full?:false, empty?:false, stormy?:false)
      subject.land(airport)
      subject.take_off(airport)
      expect(plane).to_not be_landed
    end
    it 'cannot take off when airport is empty' do
      allow(airport).to receive_messages(full?:false, stormy?:false)
      subject.land(airport)
      allow(airport).to receive(:empty?).and_return(:true)
      message = 'Airport is empty!'
      expect{plane.take_off(airport)}.to raise_error message
    end
    it 'cannot take off when weather is stormy' do
      allow(airport).to receive_messages(full?:false, empty?:false, stormy?:false)
      subject.land(airport)
      allow(airport).to receive(:stormy?).and_return(:true)
      message = 'Too stormy to take off!'
      expect{plane.take_off(airport)}.to raise_error message
    end
    it 'cannot take off if it is already flying' do
      allow(airport).to receive_messages(empty?:false, stormy?:false)
      message = 'Plane is still flying!'
      expect{plane.take_off(airport)}.to raise_error message
    end
  end

end
