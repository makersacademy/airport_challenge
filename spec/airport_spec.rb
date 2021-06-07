require 'airport'
require 'plane'

describe Airport do
  let(:airport) { Airport.new }
  let(:plane) { double :plane }

  describe '#take_off' do
    it { is_expected.to respond_to :take_off}

    it 'can confirm the plane is no longer in the airport after take_off' do
      expect(subject.take_off(plane)).to eq "Successfull take-off"
    end

  end

  describe '#land_plane' do
    it { is_expected.to respond_to :land_plane}

    it 'can prevent plane landing when airport is full' do
      subject.current_weather == "clear"
      # allow(plane).to receive(:current_location).and_return(false)
      Airport::DEFAULT_CAPACITY.times { subject.land_plane(plane) }
      expect { subject.land_plane(plane) }.to raise_error "Airport is full"
    end

    it 'clears the plane for landing' do
      plane = Plane.new
      subject.land_plane(plane)
      subject.take_off(plane)
      expect(plane.landed?).to eq false
    end
    
  end
  
  describe '#current_weather' do
    it 'can set the current weather' do
      expect(subject.current_weather("stormy")).to eq "stormy"
    end
  
    it { is_expected.to respond_to :stormy?}
  
    it 'raises error when stormy' do
      subject.current_weather("stormy")
      expect { subject.take_off(plane) }.to raise_error "Grounded due to stormy weather"
      expect { subject.land_plane(plane) }.to raise_error "Too stormy to land"
    end
  
  end

  # it 'cannot land if it is already in the airport' do
  #   expect { subject.land_plane(plane) }.to raise_error "Already in airport"
  # end
  describe 'capacity' do
    it 'gives default capacity of 10' do
      expect(subject.capacity).to eq(10)
    end
    
    it 'allows override of capacity' do
      new_airport = Airport.new(20)
      expect(new_airport.capacity).to eq(20)
    end

  end
  
end
