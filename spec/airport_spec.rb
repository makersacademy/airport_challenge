require 'airport'
require 'plane'

describe Airport do
  plane = Plane.new
  it 'Airport accepts planes' do
    expect(subject.accept_plane(plane)).to eq true 
  end
  it 'Airport releases planes' do
    expect(subject.release_plane(plane)).to eq true 
  end 
  it 'Has a default capacity' do
    expect(subject.capacity).to eq(Airport::CAPACITY)
  end

  it 'Airport can not take 21 planes' do
    21.times { subject.land Plane.new }
    expect { subject.land (Plane.new) }.to_not raise_error(RuntimeError)
  end

  it 'Airport can take 20 planes' do
    20.times { subject.land Plane.new }
    expect { subject.land (Plane.new) }.not_to raise_error 'Airport is full!'
  end

  it 'checks if plane has left airport' do 
    expect { subject.plane_setting_off }.not_to raise_error 'Weather too bad for flying'
  end

  it 'plane departed' do 
    subject.land(Plane.new)
    expect { subject.planes.pop }.to change { subject.planes.length }.by(-1)
  end 

  describe 'plane has landed' do 
    it 'lands the plane' do
      subject.land(Plane.new)
      expect { subject.land(Plane.new) }.to change { subject.planes.length }.by(1)
    end
  end

  describe 'take off' do
    context 'when not stormy' do
      before do
        allow(subject).to receive(:stormy?).and_return false
      end
      it 'instructs a plane to take off' do
        expect(subject).to respond_to(:plane_setting_off).with(0).argument
      end
    end 
    context 'when stormy' do
      before do
        allow(subject).to receive(:stormy?).and_return true
      end
      it 'instructs a plane to take off' do
        expect(subject).to respond_to(:plane_setting_off).with(0).argument
      end
    end
  end
end
