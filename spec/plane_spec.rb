require 'plane'
require 'flight_codes'

describe Plane do
  it 'flight number is randomly generated from object_id & country codes' do
    objid = subject.object_id.to_s.split("")[9, 14].join
    code = subject.flight_no.split("").last(2).join
    expect(subject.flight_no.include?(objid) && CountryCodes.new.country_codes.include?(code)).to be true
  end

  describe '#get_origin' do
    it 'returns the full origin name to instance variable @origin' do
      subject.instance_variable_set(:@flight_no, '11111GB')
      subject.get_origin
      expect(subject.origin).to eq 'United_Kingdom'
    end
  end

  describe '#set_destination' do
    it 'sets the flight_no with a valid destination code' do
      subject.set_destination
      code = subject.flight_no.split("").last(2).join
      expect(CountryCodes.new.country_codes.include?(code)).to be true
    end

    it 'sets a valid destination name to @destination' do
      subject.set_destination
      code = subject.flight_no.split("").last(2).join
      name = CountryCodes.new.search_by_code(code)
      expect(CountryCodes.new.full_names.include?(name)).to be true
    end

    it 'sets origin as \'!!!This_Airport!!!\', with c_code \'xx\'' do
      subject.set_destination
      code = CountryCodes.new.search_by_name(subject.origin)
      expect(code == 'xx' && subject.origin == '!!!This_Airport!!!').to be true
    end
  end
end