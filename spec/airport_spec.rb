require 'airport'

describe Airport do

  let (:good_weather) { double(:good_weather, :stormy? => false) }
  let (:subject) { Airport.new(good_weather) }
  let (:plane) { double(:plane) }


  it 'creates new airport object' do
    expect(Airport.new.is_a? Airport).to eq true
  end

  it { is_expected.to respond_to :land }
  it { is_expected.to respond_to :take_off }

  it 'instructs plan to land and returns a plane instance in an array' do
    plane = Plane.new
    expect(subject.land(plane)).to eq [plane]
  end

  it 'instructs an instance of plane to land and returns a list of planes' do
    plane1 = Plane.new
    plane2 = Plane.new
    subject.land(plane1)
    expect(subject.land(plane2)).to eq [plane1, plane2]
  end

  it 'instructs a plane to take off and returns plane' do
    plane = Plane.new
    subject.land(plane)
    expect(subject.take_off).to eq plane
  end

  it 'checks plane is no longer on plane list' do
    plane = Plane.new
    subject.land(plane)
    subject.take_off
    expect(subject.plane_list).not_to include plane
  end

end
