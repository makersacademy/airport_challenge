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
    it 'should let plane to take off' do
      expect(subject.take_off(plane)).to eq(plane)
    end
  end

end
