require 'plane'

describe Plane do
  describe 'initialize' do
    it 'is created on the ground' do
      pending('next user story')
      expect(subject).to be_landed
    end
  end

  it {is_expected.to respond_to(:to_land)}

  it 'will land when instructed to' do
    #subject.to_land
  end

  it 'will only land if it is in the air' do
    pending('edge case')
    edgecase
  end

  it 'confirm it has landed' do
    subject.to_land
    subject.confirm_landed
    expect(subject).to be_landed
  end

end
