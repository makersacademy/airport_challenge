require 'plane.rb'

describe Plane do

  it 'is landed at initialization' do
    expect(subject.landed).to eq true
  end

  describe '.take_off' do

    it 'allows a plane to take off' do
      subject.take_off
      expect(subject.landed).to eq false
    end

  end

  describe '.land' do

    it 'allows a plane to land' do
      subject.take_off
      subject.land
      expect(subject.landed).to eq true
    end

  end

end
