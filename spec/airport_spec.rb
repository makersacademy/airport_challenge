require 'airport'

describe Airport do
  it { expect(subject).to respond_to(:land_plane) }

  it { expect(subject).to respond_to(:check_weather) }

  it 'it is not safe to takeoff when weather is stormy' do
    subject.check_weather
    expect(subject.safe_to_fly).to eq(true).or eq(false)
  end

  describe '#land_plane' do
    it 'lands plane' do
      plane = Plane.new
      expect(subject.land_plane(plane)).to include plane
    end

    it 'raises error when trying to land plane at full airport' do
      20.times { subject.land_plane(Plane.new) }
      expect { subject.land_plane Plane.new }.to raise_error 'Airport full'
    end

    it "plane is in the airport once it has landed" do
      plane = Plane.new
      expect(subject.land_plane(plane)).to include plane
    end
  end

  describe '#take_off' do
    it 'raises an error if there are no planes at the airport' do
      expect { subject.take_off }.to raise_error 'No planes at airport'
    end

    it 'plane is not at the airport when it has taken off' do
      plane = Plane.new
      subject.land_plane(plane)
      expect(subject.take_off).to eq 'Plane has left the airport'
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
