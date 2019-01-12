require 'plane'
require 'rspec'

describe Plane do
  # context 'plane can respond to ATC instructions' do
  #   it 'should respond to landing requests' do
  #     expect(subject).to respond_to(:land).with(1)
  #   end
  #   it 'should respond to takeoff requests' do
  #     expect(subject).to respond_to(:takeoff)
  #   end
  # end

  before(:each) do
    @plane = Plane.new
  end

  describe 'plane creation' do

    it 'should be flying initially' do
      expect(@plane.landed?).to be false
    end
  end



end
