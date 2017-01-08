require 'plane'

describe Plane do
  context 'when landing the plane' do
    it 'instruct to land' do
    expect(subject).to respond_to(:land)
    end
    it 'can confirm its status' do
      expect(subject.land).to eq 'landed'
    end
  end


  context 'when taking off' do
    it 'instruct to take off' do
    expect(subject).to respond_to(:take_off)
    end
    it 'can confirm its status' do
      expect(subject.take_off).to eq 'took off'
    end
  end
end
