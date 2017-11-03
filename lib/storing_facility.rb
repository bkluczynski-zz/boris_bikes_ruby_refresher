
class StoringFacility

  attr_reader :bikes

  def initialize
    @bikes = [];
  end

  def dock(bike)
    bikes.push(bike)
  end


end
