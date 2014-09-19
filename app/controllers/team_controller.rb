class TeamController < ApplicationController
  def index
    @teams = Team.all('football.dat')
  end

  def fetch
    @team = Team.find(params[:team])

    respond_to do |format|
      format.js
    end
  end
end
