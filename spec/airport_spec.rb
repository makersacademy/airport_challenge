require 'airport'

RSpec.describe Airport do
  describe 'call_to_land' do
    it 'requests a flying plane to land on the airport' do
      plane = Plane.new
      expect(subject.call_to_land(plane)).to eq "#{plane} landed!"
    end
    it 'throws an error when airport is full' do
      subject.capacity.times { subject.call_to_land(Plane.new) }
      expect { subject.call_to_land(Plane.new) }.to raise_error('No free docks!')
    end
  end
  describe 'call_to_take_off' do
    it 'requests a landed plane to take off' do
      plane = Plane.new(false)
      expect(subject.call_to_take_off(plane)).to eq 'Done!'
    end
  end
    
end
