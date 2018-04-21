require 'airport'

describe Airport do

  describe 'Set-up and capacity of Airport' do
    it 'Has a default capacity of 10 on set-up' do
      expect(subject.capacity).to equal 10
    end

    it 'The capacity can be changed' do
      subject.change_capacity(15)
      expect(subject.capacity).to equal 15
    end

    it 'Can have a custom capcity on set-up' do
      new_airport = Airport.new(30)
      expect(new_airport.capacity).to equal 30
    end
  end

  describe 'Can instruct a plane to land' do
    let(:plane) { Plane.new }

    it 'Will land the plane' do
      expect(subject.land_plane(plane)).to eq "#{plane} plane landed"
    end
  end
end
