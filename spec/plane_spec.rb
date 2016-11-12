require 'plane.rb'

describe Plane do

  it 'starts off landed' do
    expect(subject.landed?).to eq true
  end

  describe '#take_off' do

    it 'can take off' do
      subject.take_off
      expect(subject.landed?).to eq false
    end

  end

  describe '#land' do

    it 'can land' do
      subject.take_off
      subject.land
      expect(subject.landed?).to eq true
    end

  end



end
