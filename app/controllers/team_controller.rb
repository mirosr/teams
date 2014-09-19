class TeamController < ApplicationController
  def index
    @teams = Team.all('football.dat')
  end
end
