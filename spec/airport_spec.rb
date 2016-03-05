require 'airport'

describe Airport do

  describe 'planes array' do
    it 'should have an empty planes array on initialization' do
      expect(subject.planes).to eq []
    end
  end

  describe 'capacity' do
    it 'should respond to capacity' do
      expect(subject).to respond_to(:capacity)
    end

    it 'should have a default capacity of 10 when initialized.' do
      expect(subject.capacity).to eq 10
    end

    it 'should raise an error when the airport is full' do
      10.times {(Airplane.new).land_plane(subject)}
      expect{ (Airplane.new).land_plane(subject) }.to raise_error 'Airport is full'
    end
  end

end
