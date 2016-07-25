class Admin::ProjectsController < Admin::BaseController

  def new
    @project = Project.new
  end

  def create
    @project = Project.new(project_params)
    if @project.save
      redirect_to admin_projects_path
    else
      render :new
    end
  end

  def index
    @projects = Project.all
  end

  def edit
    @project = Project.find(params[:id])
  end

  def update
    @project = Project.find(params[:id])
    if @project.update_attributes(project_params)
      redirect_to admin_projects_path
    else
      render :edit
    end
  end

  def destroy
    @project = Project.find(params[:id])
    if @vendor.destroy
      flash[:notice] = t('success', obj: 'meow meow', past_participle: 'deleted')
    end
    redirect_to admin_projects_path
  end

  protected

    def project_params
      params.require(:project).permit(
        :title,
        :sub_title,
        :description,
        :cost
      )
    end
end