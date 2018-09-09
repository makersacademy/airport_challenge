require 'airtraffic_controller'

describe Airport do

  it 'Should create a new airport' do
    expect(luton = Airport.new).to eq(luton)
  end

  it { is_expected.to respond_to(:land) }
  it { is_expected.to respond_to(:check) }

  it "Should contain empty array hanger." do
    expect(subject.hanger).to eq([])
  end

  it 'Should remove plane from hanger' do
    slingsby_firefly = Plane.new
    expect(subject.take_off(slingsby_firefly)).to eq []
  end

  it 'Should land plane in hanger' do
    slingsby_firefly = Plane.new
    expect(subject.land(slingsby_firefly)).to eq [slingsby_firefly]
  end

  it 'Should check if a plane isnt in the hanger' do
    slingsby_firefly = Plane.new
    expect(subject.check(slingsby_firefly)).to eq false
  end

  it 'Should check if a plane is in the hanger' do
    slingsby_firefly = Plane.new
    subject.land(slingsby_firefly)
    expect(subject.check(slingsby_firefly)).to eq true
  end

end
