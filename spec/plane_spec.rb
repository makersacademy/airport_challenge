require 'plane'

RSpec.describe Plane do
  it 'can take off' do
    subject.takeoff
    expect(subject.flying).to eq(true)
  end

  it 'can land' do
    subject.takeoff
    subject.land
    expect(subject.flying).to eq(false)
  end

  it 'cannot take off if already in the air' do
    subject.takeoff
    expect(subject.takeoff).to eq('Plane is already flying')
  end

  it 'cannot land if alreday on the ground' do
    expect(subject.land).to eq('Plane is already on the ground')
  end
end
