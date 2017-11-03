class Garage

  attr_reader :bikes

  def initialize
    @bikes = [];
  end

  def repair_bikes
    bikes.map!{ |bike| bike.repair }
  end

  def dock(bike)
    bikes.push(bike)
  end
  


end
