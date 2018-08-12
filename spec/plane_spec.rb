require 'plane'
require 'flight_codes'

describe Plane do
  it 'flight number is sample country code along with rand(99999)' do
    code = subject.flight_no.split("").first(2).join
    expect(subject.country_codes.include?(code)).to be true
    end

  describe '#set_destination' do
    it 'sets the flight_no with a valid destination code' do
      subject.set_destination
      code = subject.flight_no.split("").first(2).join
      expect(subject.country_codes.include?(code)).to be true
    end

    it 'sets a valid destination name to @destination' do
      subject.set_destination
      code = subject.flight_no.split("").first(2).join
      name = subject.search_by_code(code)
      expect(subject.full_names.include?(name)).to be true
    end

    it 'sets origin as \'!!!This_Airport!!!\', with c_code \'xx\'' do
      subject.set_destination
      code = subject.search_by_name(subject.origin)
      expect(code == 'xx' && subject.origin == '!!!This_Airport!!!').to be true
    end
  end
end