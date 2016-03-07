require 'plane'

describe Plane do

  describe 'status' do
    it 'the default when created is flying' do
        expect(subject.status).to eq :flying
    end

    it 'plane can be initialized as landed' do
        plane = Plane.new(:landed)
        expect(plane.status).to eq :landed
    end

    it 'change status to landed' do
        subject.landed
        expect(subject.status).to eq :landed
    end

    it 'raise error if already landed' do
        plane = Plane.new(:landed)
        expect{plane.landed}.to raise_error
    end

    it 'raise error if already flying' do
        expect{subject.flying}.to raise_error
    end
  end
end