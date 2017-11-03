class Garage

  attr_reader :bikes

  def initialize
    @bikes = [];
  end

  def repair_bikes(bikes)
    bikes.map!{ |bike| bike.repair }
  end


end
