require 'airport.rb'

class FakePlane

  attr_accessor :status

  def taken_off
    @status = "Taken off"
  end

end

describe Airport do

  describe 'landing planes' do
    it 'lands a plane' do
      plane = FakePlane.new
      expect(subject.land(plane)).to eq plane
    end

    it 'cannot land a plane that is already landed in current airport' do
      plane = FakePlane.new
      subject.land(plane)
      expect { subject.land(plane) }.to raise_error 'That plane is already landed here!'
    end

    it 'has a default capacity' do
      Airport::DEFAULT_CAPACITY.times { subject.land(FakePlane.new) }
      expect { subject.land(FakePlane.new) }.to raise_error 'Airport is full!'
    end

    it 'has a variable capacity' do
      airport = Airport.new(100)
      100.times { airport.land(FakePlane.new) }
      expect { airport.land(FakePlane.new) }.to raise_error 'Airport is full!'
    end
  end

  describe 'taking planes off' do
    it 'lets a plane take off' do
      plane = FakePlane.new
      subject.land(plane)
      expect(subject.take_off).to eq "Taken off"
    end

    it 'warns if Airport is empty when attempting take off' do
      expect { subject.take_off }.to raise_error 'There are no planes!'
    end
  end
end
