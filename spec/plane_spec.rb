require 'plane'

describe Plane do
  describe 'land method' do
    it 'responds to land method with 1 argument (i.e. the destination airport)' do
    expect(subject).to respond_to(:land).with(1).argument
    end
  end

  describe 'landed method'
    it 'responds to landed method' do
    expect(subject).to respond_to(:landed)
    end

    it 'landed method confirms plane has landed' do
    expect(subject.landed).to eq true
    end

end