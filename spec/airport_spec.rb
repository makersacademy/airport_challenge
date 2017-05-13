require 'airport'
describe Airport do

  # subject(:airport) { Airport.new }
  it { is_expected.to respond_to(:land).with(1).argument  }
  
  it 'returns landed planes' do
 	 plane = Plane.new
 	 subject.land(plane)
 	 expect(subject.plane).to eq plane
  end

end
