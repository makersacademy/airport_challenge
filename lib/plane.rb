class Plane
  attr_reader :status

  def initialize
    @status = ""
  end

  def status
    @status.dup
  end

  def fly
    change_status("flying")
  end

  def landed
    change_status("landed")
  end

  private

  def change_status(arg)
    @status = arg
  end


end
