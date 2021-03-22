require 'plane'

describe Plane do
  it 'is initially not in flight' do
    expect(subject.in_flight).to be_falsey
  end

  
  describe '#takeoff' do
    before(:each) do 
        subject.take_off
    end

    it 'starts the flight' do
      expect(subject.in_flight).to be_truthy
    end

    it 'cannot take off if plane is already in flight' do
      expect{subject.take_off}.to raise_error{"Already in flight"}
    end
  end

  describe '#land' do
    it 'lands the plane' do
      subject.take_off
      subject.land
      expect(subject.in_flight).to be_falsey
    end

    it 'cannot land if plane is already in airport' do
      expect{subject.land}.to raise_error{"Already touched down"}
    end
  end
end