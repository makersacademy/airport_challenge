require 'airport'
require 'plane'

describe Airport do

attr_reader :weather

  let(:plane) { double :plane }

  it {is_expected.to respond_to(:plane)}

  it {is_expected.to respond_to(:land).with(1).argument}

  it 'allows you to check the weather is stormy' do
    allow(subject).to receive(:weather) { 'stormy' }
    expect(subject.weather).to eq 'stormy'
  end

  it 'allows you to check the weather is fine' do
    allow(subject).to receive(:weather) { 'fine' }
    expect(subject.weather).to eq 'fine'
  end

  describe '#takeoff' do

    it 'allows plane to takeoff from airport' do
      allow(plane).to receive(:flying=).and_return false
      allow(subject).to receive(:weather) { 'fine' }
      subject.land(plane)
      subject.takeoff(plane)
      expect(plane).to be plane
    end

    it 'Should not allow plane to takeoff if stormy' do
      allow(plane).to receive(:flying=).and_return false
      allow(subject).to receive(:weather) { 'stormy' }
      expect {subject.takeoff(plane)}.to raise_error 'The weather is stormy, no planes can take off'
    end

    it 'Should not allow plane to takeoff if not at airport' do
      allow(plane).to receive(:flying=).and_return false
      allow(subject).to receive(:weather) { 'fine' }
      expect {subject.takeoff(plane)}.to raise_error 'The plane is not at this airport!'
    end

  end

  describe '#land' do

    it 'lands a plane'do
      allow(plane).to receive(:flying=).and_return true
      allow(subject).to receive(:weather) { 'fine' }
      subject.land(plane)
      expect(plane).to be plane
    end

    it 'should not allow plane to land if aiport is full' do
      allow(plane).to receive(:flying=).and_return true
      allow(subject).to receive(:weather) { 'fine' }
      subject.capacity.times {subject.land(plane)}
      expect {subject.land(plane)}.to raise_error 'Plane can not land as airport is full'
    end

    it 'should not allow plane to land if weather is stormy' do
      allow(plane).to receive(:flying=).and_return true
      allow(subject).to receive(:weather) { 'stormy' }
      expect {subject.land(plane)}.to raise_error 'Plane can not land as the weather is to stormy'
    end
  end
end
