require 'airport'

describe Airport do
  sunny_weather = 100
  bad_weather = 3

  let(:plane) { double('plane') }

  before do
    allow(plane).to receive(:take_off)
    allow(plane).to receive(:land)
    allow(subject).to receive(:random_weather_gen) { sunny_weather }
  end

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
      subject.request_landing(plane)
      allow(subject).to receive(:random_weather_gen).and_return(bad_weather)
      expect{ subject.request_take_off(plane) }.to raise_error('bad weather alert')
    end

    it 'should not be in hanger after take off' do
      subject.request_landing(plane)
      subject.request_take_off(plane)
      expect(subject.hanger).not_to include(plane)
    end

    it 'can only take off if exists in hanger' do
      expect{ subject.request_take_off(plane) }.to raise_error('Plane does not exist in hanger!')
    end
  end

  context '#request_landing' do
    it { is_expected.to respond_to(:request_landing).with(1).arguments }

    it 'a plane cannot land in bad weather' do
      allow(subject).to receive(:random_weather_gen) { bad_weather }
      expect{ subject.request_landing(plane) }.to raise_error('bad weather alert')
    end

    it 'a plane cannot land when airport is full' do
      subject.capacity.times { subject.request_landing(Plane.new) }
      expect{ subject.request_landing(plane) }.to raise_error('Airport is full, unable to land')
    end

    it 'cannot land if already landed' do
      subject.request_landing(plane)
      expect { subject.request_landing(plane) }.to raise_error('Plane has already landed!')
    end
  end
end
