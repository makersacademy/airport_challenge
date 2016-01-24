
require_relative 'passenger'

module Security

  def passport_check(passenger)
    if passenger.name.kind_of?(String) && passenger.passport_number.kind_of?(Fixnum)
      passenger.travelling
    end
  end

  def security_threat?
    security = rand(0..100)
    if security >= 99
      true
    else
      false
    end
  end
end



# securitycheck in airport
#
# run security passed or failed
