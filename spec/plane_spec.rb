 require 'plane'
 
 describe 'Plane' do 
    subject(:plane) {Plane.new }

    describe "#take_off" do
    it { is_expected.to respond_to :take_off }

    it "raises an error if already flying" do
        expect { plane.take_off }.to raise_error "Cannot take off, plane already flying"
    end 
    end 

    describe "#land" do 
    it { is_expected.to respond_to :land }

    it "raises an error if already flying" do
        expect { plane.land }.to raise_error "Cannot land, plane already landed"
    end 
    end 

    # describe "#landed" do 
    # it "returns plane not flying" do 
    #     expect(plane.landed).to eq false
    # end

    # end
end 