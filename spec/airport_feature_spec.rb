require 'airport'

feature Airport do
  scenario 'taking off and landing multiple planes' do
    allow(subject).to receive(:weather) { 'Sunny' }
    subject.capacity = 3
    plane_one = Plane.new
    plane_two = Plane.new
    plane_three = Plane.new
    expect(subject.land_plane(plane_one)).to eq [plane_one]
    expect(subject.release_plane).to eq plane_one
    expect(subject.land_plane(plane_two)).to eq [plane_two]
    expect(subject.land_plane(plane_three)).to eq [plane_two, plane_three]
    expect(subject.release_plane).to eq plane_three
    expect(subject.release_plane).to eq plane_two
    expect(subject.empty?).to eq 'There are no planes in the hanger'
  end
end
