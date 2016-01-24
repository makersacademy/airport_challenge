require 'plane.rb'

describe Plane do
  let(:airport) { double :airport }

  describe 'initialize' do
    it 'it initializes in the air' do
      expect(subject.landed?).to eq false
    end
  end
  describe 'landed?' do
    it 'returns true is the plane has landed and is on the ground' do
      subject.land
      expect(subject.landed?).to eq true
    end
  end

  describe '#land' do
    it 'sets the planes status to landed' do
      expect(subject.land).to eq true
    end
  end

  describe '#takeoff' do
    it 'sets landed to false' do
      subject.takeoff
      expect(subject.landed?).to eq false
    end
  end
  # describe 'initialize' do
  #   it 'initializes with airborne false' do
  #
  #   end
  # end

  # describe '#clearance' do
  #   it 'returns planes clearance' do
  #     expect(subject.clearance).to eq false
  #   end
  # end
  #
  # describe '#request_clearance' do
  #   it 'requests clearance from the airport and sets planes clearance to true' do
  #     allow(airport).to receive(:clearance?).and_return(true)
  #     subject.request_clearance(airport)
  #     expect(subject.clearance).to eq true
  #   end
  #
  #   it 'resets clearance to false if clearance is currently true' do
  #     allow(airport).to receive(:clearance?).and_return(true)
  #     subject.request_clearance(airport)
  #     subject.request_clearance(airport)
  #     expect(subject.clearance).to eq false
  #   end
  # end

end
