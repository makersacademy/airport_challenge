require 'plane'

describe Plane do
  describe 'initialize' do
    it 'is created on the ground' do
      pending('next user story')
      expect(subject).to be_landed
    end
  end

  it {is_expected.to respond_to(:to_land)}

  it {is_expected.to respond_to(:took_off)}

  it 'confirm it is in the air' do
    subject.to_land
    subject.took_off
    expect(subject).to be_in_air
  end

  it 'confirm it has landed' do
    subject.to_land
    expect(subject).to be_landed
  end
end
