require_relative './lib/plane'

describe Plane do
    subject {Class.new}
  
    it 'Plane is flying.  Responds to the flying method.' do
      expect(subject).to respond_to (:flying?)
    end
  
    it 'Plane has landed and so is not flying' do
      subject.land?
      expect(subject).not_to respond_to (:flying?)
    end
  end