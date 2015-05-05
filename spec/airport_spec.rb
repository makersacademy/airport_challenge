require 'airport'
require 'plane'

describe Airport do
  context 'Permission to land' do
    it { is_expected.to respond_to :allow_landing }
  end

  context 'Permission to takeoff' do
    it { is_expected.to respond_to :allow_takeoff }
  end

  context 'When the airport is full' do
    it 'should raise error and refuse landing permission' do
      airport = Airport.new
      6.times { subject.allow_landing Plane.new }
      expect { subject.allow_landing Plane.new }.to raise_error 'Airport is full!'
    end
  end

  # context 'traffic control' do
  #   it 'a plane cannot land if the airport is full'

  #   context 'weather conditions' do
  #     it 'a plane cannot take off when there is a storm brewing'
  #     expect { subject.allow_landing aeroplane }.to raise_error 'It\'s too stormy to fly!'

  #     it 'a plane cannot land in the middle of a storm'
  #     expect { subject.allow_takeoff aeroplane }.to raise_error 'It\'s too stormy to land!'
  # #   end
  # end
end