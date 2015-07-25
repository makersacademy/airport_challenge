require 'plane'

describe Plane do

  it 'is flying when created' do
    expect(subject.flying).to eq true
  end

  it 'cannot land when created' do
    expect(subject.can_land).to eq false
  end

  describe 'landing' do
    it 'can prepare_to_land when instructed' do
      expect(subject.prepare_to_land).to eq true
    end

    it 'is landed after landing' do
      expect(subject.land).to eq false
    end
  end

  describe 'taking off' do
    it 'can prepare_to_take_off when instructed' do
      expect(subject.prepare_to_take_off).to eq true
    end

    it 'is flying after take off' do
      expect(subject.take_off).to eq true
    end
  end

end
