 require 'airport'

 describe Airport do
   
  it { is_expected.to respond_to :land_plane }

  describe '#land_plane' do
    it 'allows plane to land in airport' do
      plane = "plane"
      
      expect(subject.land_plane(plane)).to eq(plane)
    end
  end

 end