require './lib/plane.rb'

describe Plane do

  subject {Plane.new}

  it 'shows flying status when created' do
    expect(subject.flying?).to eql(true)
  end

  describe 'landing' do
    it 'can land' do
      subject.take_off
      subject.land
      expect(subject.flying?).to eql(false)
    end

    it 'shows landed status after landing' do
      subject.land
      expect(subject.flying?).to eql(false)
    end
  end

  describe 'taking off' do
    it 'can take off' do
      subject.land
      subject.take_off
      expect(subject.flying?).to eql(true)
    end

    it 'shows flying status after take off' do
      subject.take_off
      expect(subject.flying?).to eql(true)
    end
  end
end
