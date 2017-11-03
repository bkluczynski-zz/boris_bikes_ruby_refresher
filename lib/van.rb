require_relative 'docking_station'

class Van

  attr_reader :bikes_storage

  def initialize
    @bikes_storage = [];
  end

  def receive_broken_bikes(bikes)
    bikes.map{|bike| bikes_storage << bike}
  end



end
