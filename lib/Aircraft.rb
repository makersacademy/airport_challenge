class Aircraft

  def initialize
    @on_ground = true
  end

  def landed?
    if @on_ground
      return 'SUCCESSFUL LANDING CONFIRMATION'
    end
  end

end
