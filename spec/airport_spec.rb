require 'airport'

describe Airport do

    it "will respond to landing_plane" do
      #confirm no landing  - stormy whether
    expect(subject).to respond_to :plane_landing
  end

    it "will respond to airport_full no landing" do
    expect(subject).to respond_to :airport_full
  end

    it "will confirm plane landed in airport" do
      plane = Plane.new
    expect(subject.landed(plane)).to eq plane
  end

    it "will confirm default capacity at 20" do
    expect(subject.capacity).to eq 20
  end

  describe '#plane_landing' do
    it 'raises error when full' do
        20.times { subject.plane_landing Plane.new }
        expect { subject.plane_landing Plane.new}.to raise_error 'Airport_full'
  end


# describe '#plane_landing' do
#   it 'raises error code for storm (20) raised' do
#     expect {subject.plane_landed}.to raise_error 'Storm approching, advise redirection to another airport'
#       end
end
end
