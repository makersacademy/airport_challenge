require 'airport'

describe Airport do
  let(:weather) { double(:weather, sunny?: true) }
  let(:plane) { double('plane') }
  subject { Airport.new( { weather: weather } ) }

  it 'has a default capacity' do
    expect(Airport::DEFAULT_CAPACITY).to eq 20
  end
  
  it 'has a specified capacity' do
    subject { Airport.new({capacity: 50, weather: weather}) }
    subject.capacity.times do
      subject.request_landing(plane)
    end
    expect{ subject.request_landing(plane) }.to raise_error(RuntimeError, "Airport Full")
  end

  it 'is created with a Weather instance' do
    expect(Airport.new({weather: weather})).to be_a(Airport)
  end
  
  describe '#request_landing' do
    it 'returns :granted when safe' do
      expect(subject.request_landing(plane)).to eq :granted
    end

    it 'raises error denied when unsafe' do
      allow(weather).to receive(:sunny?) { false }
      expect{ subject.request_landing(plane) }.to raise_error(RuntimeError, 'Not safe for landing')
    end
    
    it 'returns :denied when unsafe' do
      Airport::DEFAULT_CAPACITY.times do
        subject.request_landing(plane)
      end
      expect{ subject.request_landing(plane) }.to raise_error(RuntimeError, 'Airport Full')
    end
  end

  describe '#request_takeoff' do
    it 'returns :granted when safe' do
      allow(weather).to receive(:sunny?) { true }
      expect(subject.request_takeoff(plane)).to eq :granted
    end

    it 'returns :denied when unsafe' do
      allow(weather).to receive(:sunny?) { false }
      expect{ subject.request_takeoff(plane) }.to raise_error(RuntimeError, 'Not safe for takeoff')
    end
  end
  
  # describe '#move_to_hangar' do
  #   let(:plane2) { double('plane') }
  #   it 'adds landed planes to the hangar' do
  #     expect(subject.move_to_hangar(plane)).to eq [plane]
  #   end
    
  #   it "doesn't remove existing planes" do
  #     subject.move_to_hangar(plane)
  #     expect(subject.move_to_hangar(plane2)).to eq [plane, plane2]
  #   end
  # end
  
  # describe '#full?' do
  #   it 'returns true if hangar at capacity' do
  #     Airport::DEFAULT_CAPACITY.times do
  #       subject.request_landing(plane)
  #     end
  #     expect(subject.full?).to eq true
  #   end
    
  #   it 'returns false if the hangar is below capacity' do
  #     subject.move_to_hangar(plane)
  #     expect(subject.full?).to eq false
  #   end
  # end
  
  # describe '#safe?' do
  #   it 'returns true if airport not #full?' do
  #     expect(subject.safe?).to eq true
  #   end
    
  #   it 'returns false if airport #full?' do
  #     Airport::DEFAULT_CAPACITY.times do
  #       subject.request_landing(plane)
  #     end
  #     expect{ subject.safe? }.to raise_error(RuntimeError, "Airport Full")
  #   end

  #   it 'returns true if the Weather is sunny' do
  #     expect(subject.safe?).to eq true
  #   end

  #   it 'returns false if the Weather is stormy' do
  #     allow(weather).to receive(:sunny?) { false }
  #     expect{ subject.safe? }.to raise_error(RuntimeError, "Not safe to land")
  #   end
  # end
end