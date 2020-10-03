require 'planes'

describe Planes do

  describe '#take_off' do
    it 'responds when called' do
      plane = Planes.new
      expect(plane).to respond_to :take_off
    end

    it 'updates status when called' do
      subject.take_off
      expect(subject.status).to eq 'in air'
    end
  end

  describe '#land' do
    it 'responds when called' do
      plane = Planes.new
      expect(plane).to respond_to :land
    end

    it 'updates status when called' do
      subject.land
      expect(subject.status).to eq 'landed'
    end
  end

  describe '#confirm_status' do
    it 'responds when called' do
      plane = Planes.new
      expect(plane).to respond_to :confirm_status
    end
  end
end
