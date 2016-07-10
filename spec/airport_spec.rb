require 'airport'

describe Airport do
  let(:plane) { double('plane') }

  it 'default airport capacity' do
    expect(Airport::DEFAULT_CAPACITY).to eq 10
  end

  context 'increasing default capacity' do
    capacity = 20
    it 'should not raise error when increasing capacity' do
      expect { Airport.new(capacity) }.not_to raise_error
    end
    it 'increase default capacity' do
      airport = Airport.new(capacity)
      expect(airport.capacity).to eq capacity
    end
  end

  context '#request_take_off' do
    it { is_expected.to respond_to(:request_take_off).with(1).arguments }

    it 'a plane cannot take off in bad weather' do
      allow(plane).to receive(:take_off)
      allow(subject).to receive(:weather_status).and_return("Stormy")
      expect{ subject.request_take_off(plane) }.to raise_error
    end

    it 'should not be in hanger after take off' do
      allow(plane).to receive(:land)
      allow(plane).to receive(:take_off)
      subject.request_landing(plane)
      subject.request_take_off(plane)
      expect(subject.hanger).not_to include(plane)
    end

    it 'can only take off if exists in hanger' do
      allow(plane).to receive(:take_off)
      expect{ subject.request_take_off(plane) }.to raise_error
    end
  end

  context '#request_landing' do
    it { is_expected.to respond_to(:request_landing).with(1).arguments }

    it 'a plane cannot land in bad weather' do
      allow(plane).to receive(:land)
      allow(subject).to receive(:weather_status).and_return("Stormy")
      expect{ subject.request_landing(plane) }.to raise_error
    end

    it 'a plane cannot land when airport is full' do
      allow(plane).to receive(:land)
      subject.capacity.times { subject.request_landing(Plane.new) }
      expect{ subject.request_landing(plane) }.to raise_error
    end

    it 'cannot land if already landed' do
      allow(plane).to receive(:land)
      subject.request_landing(plane)
      expect { subject.request_landing(plane) }.to raise_error
    end
  end
end
