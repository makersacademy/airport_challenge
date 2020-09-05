require 'airport_class'
require "plane_class"

describe Airport do

  describe 'plane respond to #land' do
    it { expect(subject).to respond_to(:land)}
  end

  describe 'plane respond to #take_off' do
    it { expect(subject).to respond_to(:take_off)}
  end

  describe 'plane has left airport' do
    it { expect(subject.has_departed).to eq true}
  end

  describe 'prevent landing if airport is full' do
    it { expect {raise (subject.land(plane))}.to raise_error}
  end 

end
