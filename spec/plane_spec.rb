require 'plane'

describe Plane do
  describe 'initialize' do
    it 'is created on the ground' do
      pending('next user story')
      expect(subject).to be_landed
    end
  end

  it {is_expected.to respond_to(:to_land)}

  it 'confirm it has landed' do
    subject.to_land
    expect(subject).to be_landed
  end

end
