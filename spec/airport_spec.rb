require 'airport'

describe Airport do
  let(:weather) { double(:weather, sunny?: true) }
  let(:plane) { double('plane') }
  subject { Airport.new({ weather: weather }) }

  it 'has a default capacity' do
    expect(Airport::DEFAULT_CAPACITY).to eq 20
  end
  
  it 'has a specified capacity' do
    subject { Airport.new({ capacity: 50, weather: weather }) }
    subject.capacity.times do
      subject.request_landing(plane)
    end
    expect { subject.request_landing(plane) }.to raise_error(RuntimeError, "Airport Full")
  end

  it 'is created with a Weather instance' do
    expect(Airport.new({ weather: weather })).to be_a(Airport)
  end
  
  describe '#request_landing' do
    it 'returns :granted when safe' do
      expect(subject.request_landing(plane)).to eq :granted
    end

    it 'raises error denied when unsafe' do
      allow(weather).to receive(:sunny?) { false }
      expect { subject.request_landing(plane) }.to raise_error(RuntimeError, 'Not safe for landing')
    end
    
    it 'returns :denied when unsafe' do
      Airport::DEFAULT_CAPACITY.times do
        subject.request_landing(plane)
      end
      expect { subject.request_landing(plane) }.to raise_error(RuntimeError, 'Airport Full')
    end
  end

  describe '#request_takeoff' do
    it 'returns :granted when safe' do
      allow(weather).to receive(:sunny?) { true }
      expect(subject.request_takeoff(plane)).to eq :granted
    end

    it 'returns :denied when unsafe' do
      allow(weather).to receive(:sunny?) { false }
      expect { subject.request_takeoff(plane) }.to raise_error(RuntimeError, 'Not safe for takeoff')
    end
  end
end
