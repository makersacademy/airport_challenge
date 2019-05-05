require 'airports'

describe Airport do
  def not_stormy
    allow(subject.weather).to receive(:stormy?) { false }
  end

  it 'should store landed planes' do
    not_stormy
    plane = Plane.new
    plane.land_at(subject)
    expect(subject.planes.include?(plane)).to eq(true)
  end

  it 'should not contain planes which have taken off' do
    not_stormy
    plane = Plane.new
    plane.land_at(subject)
    plane.take_off_from(subject)
    expect(subject.planes.include?(plane)).to eq(false)
  end
end
