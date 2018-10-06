# This spec tests the airport in airport.rb
require 'airport'

describe Airport do

  describe '#Landing procedures' do
    it 'adds plane to the at_airport array' do
      plane = Plane.new
      expect(subject).to receive(:stormy?).and_return(false)
      expect(subject.instruct_landing(plane)).to eq [plane]
    end

    it 'Should hold multiple planes' do
      p1, p2, p3, p4 = Plane.new
      expect(subject).to receive(:stormy?).at_least(4).times.and_return(false)
      subject.instruct_landing(p1)
      subject.instruct_landing(p2)
      subject.instruct_landing(p3)
      subject.instruct_landing(p4)
      expect(subject.number_grounded).to eq 4
    end

    it 'prevents landing when stormy' do
      expect(subject).to receive(:stormy?).and_return(true)
      expect { subject.instruct_landing Plane.new }.to raise_error 'Can not land do to stormy weather'
    end
  end

  describe '#Takeoff procedures' do
    it 'expects plane to takeoff and leave the airport' do
      plane = Plane.new
      expect(subject).to receive(:stormy?).and_return(false)
      expect(subject.instruct_takeoff(plane)).to eq plane
    end

    it 'expects airport to be empty' do
      plane = Plane.new
      expect(subject).to receive(:stormy?).at_least(2).times.and_return(false)
      subject.instruct_landing(plane)
      subject.instruct_takeoff(plane)
      expect(subject.empty?).to eq true
    end

    it 'expects plain can not take off due to weather' do
      expect(subject).to receive(:stormy?).and_return(true)
      expect { subject.instruct_takeoff Plane.new }.to raise_error 'Can not takeoff do to stormy weather'
    end
  end

  describe '#stormy? feature' do
    it 'expected to respond to true' do
      expect(subject).to receive(:stormy?).and_return(true)
      expect(subject.stormy?).to eq true
    end

    it 'expected to respond to false' do
      expect(subject).to receive(:stormy?).and_return(false)
      expect(subject.stormy?).to eq false
    end

    it 'expected to equal new weather' do
      weather = Weather.new
      allow(weather).to receive(:rand).and_return(6)
      expect(subject.stormy?(weather)).to eq weather
    end
  end
end
