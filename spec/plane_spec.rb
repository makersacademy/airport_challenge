require 'plane'

describe Plane do
  describe 'initialize' do
    it 'is created in the air' do
      plane = Plane.new
      expect(subject.in_air?).to eq true
    end
  end

  it {is_expected.to respond_to(:to_land)}

  it {is_expected.to respond_to(:take_off)}

  it 'confirm it is in the air' do
    subject.to_land
    subject.take_off
    expect(subject).to be_in_air
  end

  it 'will only land if it is in the air' do
    msg = 'Plane already landed'
    subject.to_land
    expect{subject.to_land}.to raise_error msg
  end

  it 'confirm it has landed' do
    subject.to_land
    expect(subject).not_to be_in_air
  end

  it 'will only take-off if it is on the ground' do
    msg = 'Plane already in the air'
    subject.to_land
    subject.take_off
    expect{subject.take_off}.to raise_error msg
  end
end
