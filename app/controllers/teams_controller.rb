# frozen_string_literal: true

class TeamsController < ApplicationController
  before_action :set_project, only: %i[index new create]
  before_action :set_team, only: %i[show edit update destroy]
  before_action :authorize_user, only: %i[edit create update destroy]

  def index
    @teams = @project.teams
  end

  def show; end

  def new
    @team = @project.teams.new
  end

  def edit; end

  def create
    @team = @project.teams.new(team_params)
    @team.user = project_manager

    if @team.save
      redirect_to team_url(@team), notice: 'Team was successfully created.'
    else
      render :new, status: :unprocessable_entity
    end
  end

  def update
    if @team.update(team_params)
      redirect_to team_url(@team), notice: 'Team was successfully updated.'
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @team.destroy

    redirect_to projects_url, notice: 'Team was successfully destroyed.'
  end

  private

  def authorize_user
    return true if user.project_manager?

    redirect_to root_path, notice: 'You are not authorized to access this page'
  end

  def team_params
    params.require(:team).permit(:name, :size)
  end

  # Fetch any PM for now
  def project_manager
    @project_manager ||= User.project_manager.first
  end

  def set_project
    @project = Project.find_by(id: params[:project_id])
  end

  def set_team
    @team = Team.find_by(id: params[:id])
  end

  # Logedin user, which will be fetched via current_user,for now picking a random one
  def user
    User.all.sample
  end
end
