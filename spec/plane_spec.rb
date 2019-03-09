require 'plane'
describe Plane do

  # test described in step 09
  it {is_expected.to respond_to(:land) }

  describe '#land' do

    # test described in Steps 10 & 12 in the README
    # this test is a little wonky - in no way does it confirm that the
    # plane is stored at the airport and I do not know how to do that
    it "changes status to landed and stores itself" do
      plane = Plane.new
      airport = double(:airport)
      allow(airport).to receive(:store) {[plane]}
      plane.land(airport)
      expect(plane.status).to eq "landed"
    end


  end

end
