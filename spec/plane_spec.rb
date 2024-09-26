# understanding plane object tsts
require 'plane'
describe Plane do
  it { is_expected.to respond_to :status }
  it ' #initialize' do
    expect(subject.status).to eq 'flying'
  end

  it 'confirm that plane is in air' do
    expect(subject.flying).to eq 'flying'
  end
  it 'confirm that plane is in apron' do
    expect(subject.taxi).to eq 'taxi'
  end
end
