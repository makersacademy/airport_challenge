require 'plane'

describe Plane do
  it 'accepts instruction to land' do
    expect(subject).to respond_to(:land)
  end

  it 'follows instruction to land' do
    subject.land
    expect(subject.status).to eq('landed')
  end

  it 'accepts instruction to take off' do
    expect(subject).to respond_to(:take_off)
  end

  it 'follows instruction to take off' do
    subject.take_off
    expect(subject.status).to eq('airborne')
  end
end
