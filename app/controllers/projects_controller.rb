# frozen_string_literal: true

class ProjectsController < ApplicationController
  before_action :set_project, only: %i[show edit update destroy]
  before_action :authorize_user, only: %i[edit create update destroy]

  def index
    @projects = Project.all
  end

  def show; end

  def new
    @project = Project.new
  end

  def edit; end

  def create
    @project = Project.new(project_params)
    @project.user = project_manager

    if @project.save
      redirect_to project_url(@project), notice: 'Project was successfully created.'
    else
      render :new, status: :unprocessable_entity
    end
  end

  def update
    if @project.update(project_params)
      redirect_to project_url(@project), notice: 'Project was successfully updated.'
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @project.destroy

    redirect_to projects_url, notice: 'project was successfully destroyed.'
  end

  private

  def authorize_user
    return true if user.project_manager?

    redirect_to root_path, notice: 'You are not authorized to access this page'
  end

  def project_params
    params.require(:project).permit(:name, :start_date, :timeline, :status)
  end

  # Fetch any PM for now
  def project_manager
    @project_manager ||= User.project_manager.first
  end

  def set_project
    @project = project.find_by(id: params[:id])
  end

  # Logedin user, which will be fetched via current_user,for now picking a random one
  def user
    User.all.sample
  end
end
