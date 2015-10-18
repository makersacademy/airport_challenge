require 'airport'

describe Airport do

      it {is_expected.to(respond_to(:instruct_to_land).with(1).argument)}

      it {is_expected.to(respond_to(:instruct_to_take_off).with(1).argument)}

  describe '#instruct_to_land' do

      it 'lands planes' do
        plane = Plane.new
        subject.instruct_to_land(plane)
        expect(subject.instruct_to_land(plane)).to eq plane
      end

      it 'does not allow planes to land when the airport is full' do
          plane = Plane.new
          50.times {subject.instruct_to_land(plane)}
          expect {subject.instruct_to_land(plane)}.to raise_error 'The airport is full.'
      end
  end
end

  # it {is_expected.to(respond_to(:stormy))}

  # it 'does not allow planes to land when the weather is stormy' do
  #   expect {subject.land?}.to raise_error 'The weather is stormy, cannot land.'
  # end
  #
  # it 'does not allow planes to take off when the weather is stormy' do
  #   expect {subject.take_off?}.to raise_error 'The weather is stormy, cannot take_off.'
  # end
