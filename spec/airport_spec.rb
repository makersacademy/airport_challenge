require 'airport'

describe Airport do

  describe '::new' do
    it {should be_instance_of(Airport)}
  end

  describe '#instruct_plane_to_land' do
    it {should respond_to(:instruct_plane_to_land).with (1)}
    it 'should land a plane if conditions are OK'

  end
end