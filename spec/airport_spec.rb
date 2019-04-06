require 'airport'

RSpec.describe AirPort do

  RSpec.configure do |config|
    config.example_status_persistence_file_path = './spec/fail_test.txt'
  end 

  let(:plane) { Plane.new }

  describe '#land_plane' do
    it 'should be able to land plane' do
      expect(subject.land(plane)).to eq([plane])
    end
  end

  describe '#take_off' do
    it 'raises an error if there is no plane' do
      expect { subject.take_off(plane) }.to raise_error 'There are currently no planes'
    end
  end

  describe '#landed_plane' do
    it 'should return an array' do
      expect(subject.landed_plane).to eq(Array.new)
    end
  end

end
