require 'plane'

describe Plane do

  let(:plane) {Plane.new}

  it 'is flying when created' do
    expect(subject).to be_flying
  end

 describe '#land' do
 it 'airport can_land plane' do
   expect(subject).to respond_to :can_land
 end

 it 'can land' do
   plane.can_land
   plane.landed?
   expect {plane.can_land}.to raise_error 'the plane cannot land if it is not flying'
 end

 it 'is landed after landing' do
    plane.can_land
    plane.landed?
    expect(plane).to be_landed
 end

 end

 describe '#take_off'

 it 'can take off' do
   expect{subject.can_take_off}.to raise_error 'cant take off when already flying'
 end

  it 'is flying after take off' do
    expect(subject).to be_flying
  end
end
