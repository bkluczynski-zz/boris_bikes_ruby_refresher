class Bike

  attr_accessor :working

  def initialize
    @working = true;
  end

  def working?
    working
  end

  def report_broken
    self.working = false
  end

  def broken?
    working == false
  end

  def repair
    self.working = true
  end

end
