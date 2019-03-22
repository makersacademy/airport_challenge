require 'airport'

describe Airport do
  let(:plane) { double :plane }

  it { expect(subject).to respond_to(:land_plane) }

  describe '#land_plane' do
    it 'lands plane' do
      expect(subject.land_plane(plane)).to include plane
    end

    it 'raises error when trying to land plane at full airport' do\
      20.times { subject.land_plane(plane) }
      expect { subject.land_plane double(plane) }.to raise_error 'Airport full'
    end

    it 'raises an error if the weather is not safe to fly' do
      subject.safe_to_fly = false
      expect { subject.land_plane(plane) }.to raise_error 'Weather not safe to land'
    end

    it "plane is in the airport once it has landed" do
      subject.land_plane(plane)
      expect(subject.planes).to include plane
    end
  end

  describe '#take_off' do
    it 'raises an error if there are no planes at the airport' do
      expect { subject.take_off }.to raise_error 'No planes at airport'
    end

    it 'raises an error if the weather is not safe to fly' do
      subject.land_plane(plane)
      subject.safe_to_fly = false
      expect { subject.take_off }.to raise_error 'Weather not safe to take off'
    end

    it 'plane is not at the airport once it has taken off' do
      subject.land_plane(plane)
      subject.take_off
      expect(subject.planes).not_to include plane
    end
  end

  describe 'airport capacity' do
    it 'can change the capacity of the airport' do
      airport = Airport.new(30)
      expect(airport.capacity).to eq 30
    end

    it 'there is a default airport capacity' do
      airport = Airport.new
      expect(airport.capacity).to eq 20
    end
  end

end
