# frozen_string_literal: true

class DevelopersController < ApplicationController
  before_action :set_team
  before_action :authorize_user, only: %i[edit create update destroy]

  def index
    @developers = @team.users
  end

  def create
    @team.users << developer

    redirect_to team_url(@team), notice: 'Developer added into the team successfully.'
  end

  def destroy
    @team.users.delete(developer)

    redirect_to team_url(@team), notice: 'Developer removed from the team.'
  end

  private

  def authorize_user
    return true if user.project_manager?

    redirect_to root_path, notice: 'You are not authorized to access this page'
  end

  # Fetch any PM for now
  def project_manager
    @project_manager ||= User.project_manager.first
  end

  def set_team
    @team = Team.find_by(id: params[:id])
  end

  # Logedin user, which will be fetched via current_user,for now picking a random one
  def user
    User.all.sample
  end

  def developer
    @developer ||= User.find_by(id: params[:developer_id])
  end
end
