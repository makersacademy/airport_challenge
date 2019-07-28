require 'airport'

describe Airport do

	it 'responds to land_plane' do
		expect(subject).to respond_to :land
	end

	describe '#land' do
    it 'Raises an error when airport is full' do
      20.times { subject.land Plane.new }
      expect { subject.land Plane.new }.to raise_error 'Airport full'
    end
  end


end