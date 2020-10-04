require 'airport'
require 'plane'

describe Airport do

    it "will respond to plane_landing" do
      #confirm no landing  - stormy whether
    expect(subject).to respond_to :plane_landing
  end

    it "will add new plane" do
      plane = Plane.new
    expect(subject.add_landed_plane(plane)).to eq plane
  end

  it "will returns landed plane" do
    plane = Plane.new
    subject.add_landed_plane(plane)
    expect(subject.plane).to eq plane
  end

    it "will confirm default capacity at 20" do
    expect(subject.capacity).to eq 20
  end

  #describe '#plane_landing' do
    it 'raises error when full' do
        20.times { subject.plane_landing Plane.new }
        raise StandardError.new 'Airport_full'
        expect { subject.plane_landing Plane.new}.to raise_error StandardError.new 'Airport_full'
  end
end


# describe '#plane_landing' do
#   it 'raises error code for storm (20) raised' do
#     expect {subject.plane_landed}.to raise_error 'Storm approching, advise redirection to another airport'
#       end
