class TeamController < ApplicationController
  def index
    @teams = Team.all
  end

  def fetch
    @team = Team.find(params[:team])

    respond_to do |format|
      format.js
    end
  end
end
