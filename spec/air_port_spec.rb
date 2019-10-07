require './air_port'
require './air_plane'

describe Airport do
  it { should respond_to(:land) }

  it 'lands a plane' do
    new_plane = Plane.new
    subject.land(new_plane)
    expect(subject.return_plane 0).to eq new_plane
  end

  it 'doesnt land plane if capacity is full' do
    4.times do
      subject.land(Plane.new)
    end
    expect { subject.land Plane.new}.to raise_error 'Airport at capacity'
  end

  it 'correct plane takes off' do
    airport = Airport.new
    new_planes = []
    3.times do
      new_plane = Plane.new
      new_planes.push(new_plane)
      subject.land(new_plane)
    end
    expect(subject.take_off new_planes[2]).to eq [new_planes[0], new_planes[1]]
  end
end
