require 'airport.rb'

describe Airport do
  let(:plane) { double :plane }

  describe 'initialization' do
    it 'initializes with a default capacity' do
      expect(subject.capacity).to eq Airport::DEFAULT_CAPACITY
    end

    it 'has a variable capacity' do
      airport = Airport.new(100)
      expect(airport.capacity).to eq 100
    end
  end

  describe '#clear_to_land' do
    it 'instructs a plane to land at the airport' do
      allow(subject).to receive(:stormy?) { false }
      allow(plane).to receive(:landed?) { false }
      allow(plane).to receive(:land).and_return(true)
      expect(subject.clear_to_land(plane)).to include plane
    end

    it 'landing is prevented when weather is stormy' do
      allow(subject).to receive(:stormy?) { true }
      allow(plane).to receive(:land)
      expect{subject.clear_to_land(plane)}.to raise_error 'Stormy weather is preventing landing'
    end

    it 'prevents landing whent he airport is full' do
      allow(subject).to receive(:full?) { true }
      expect{subject.clear_to_land(plane)}.to raise_error 'The airport is full'
    end

    it 'prevents a plane from landing if it is already at the airport' do
      allow(subject).to receive(:stormy?) { false }
      allow(plane).to receive(:landed?) { true }
      expect{subject.clear_to_land(plane)}.to raise_error 'The plane has already landed at the airport'
    end
  end

  describe '#landed_planes' do
    it 'keeps track of planes that have landed at the airport' do
      allow(subject).to receive(:stormy?) { false }
      allow(plane).to receive(:landed?) { false }
      allow(plane).to receive(:land)
      subject.clear_to_land(plane)
      expect(subject.landed_planes).to include(plane)
    end
  end

  describe '#clear_to_takeoff' do
    it 'instructs a plane to takeoff and removes it from the landed planes array' do
      allow(subject).to receive(:stormy?) { false }
      allow(subject).to receive(:empty?) { false }
      allow(plane).to receive(:land)
      allow(plane).to receive(:landed?) { false }
      allow(plane).to receive(:takeoff)
      subject.clear_to_land(plane)
      subject.clear_to_takeoff
      expect(subject.landed_planes).not_to include plane
    end

    it 'prevents takeoff if weather is stormy' do
      allow(subject).to receive(:stormy?) { true }
      allow(subject).to receive(:empty?) { false }
      expect{subject.clear_to_takeoff}.to raise_error 'Stormy weather is preventing takeoff'
    end

    it 'raises an error if there are no planes to takeoff' do
      expect{subject.clear_to_takeoff}.to raise_error 'There are no planes at the airport'
    end

  end

  describe '#confirm_landed' do
    it 'accepts a plane and confirms if it has landed' do
      allow(plane).to receive(:landed?) {true}
      expect(subject.confirm_landed(plane)).to eq true
    end
  end

  describe '#stormy?' do
    it 'randomly returns true or false if the weather is stormy' do
      airport = double(:airport, stormy?: true)
      expect(airport.stormy?).to eq true
    end
  end

  describe '#full?' do
    it 'airport has a method called to check if it is full' do
      expect(subject).to respond_to :full?
    end

    it 'returns true when the airport has reached its capacity' do
      allow(subject).to receive(:stormy?) { false }
      allow(plane).to receive(:landed?) { false }
      allow(plane).to receive(:land)
      described_class::DEFAULT_CAPACITY.times do
        subject.clear_to_land(plane)
      end
      expect(subject.full?).to eq true
    end

    describe '#empty?' do
      it 'returns true of false depening on whether the airport is empty' do
        expect(subject.empty?).to eq true
      end
    end
  end







  # describe '#clearance?' do
  #   it 'returns clearance as true' do
  #     expect(subject.clearance?).to eq true
  #   end
  # end
  #
  # describe '#plane_lands' do
  #   it 'a plane lands and it is stored at the airport' do
  #     allow(plane).to receive(:clearance).and_return(true)
  #     landed_planes = [plane]
  #     expect(subject.plane_lands(plane)).to eq landed_planes
  #   end
  #
  #   it 'returns an error if a plane does not have clearance to land' do
  #     allow(plane).to receive(:clearance).and_return(false)
  #     expect{subject.plane_lands(plane)}.to raise_error "Plane does not have clearance to land"
  #   end
  # end
  #
  # describe '#landed_planes' do
  #   it 'returns an array with a copy of the planes at the airport' do
  #     allow(plane).to receive(:clearance).and_return(true)
  #     subject.plane_lands(plane)
  #     expect(subject.landed_planes).to eq [plane]
  #   end
  # end
end


# # let(:bike) { double :bike }
# # # bike = double(:bike, broken?: true)
#
# def stormy?
#   number = rand(0..2)
#   number == 0 ? true:false
# end
#
# p stormy?
