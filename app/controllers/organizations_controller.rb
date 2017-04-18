class OrganizationsController < ApplicationController
  def new
  end

  def create
  end

  def edit
    @organization = Organization.find(params[:id])
  end

  def update
    organization_params = params.require(:organization).permit(:name, :problem, :description, :website)
    @organization = Organization.find(params[:id])
    @organization.update(template_params)
    # redirect_to organization_path(@organization)
  end

  def destroy
    organization_params = params.require(:organization).permit(:name, :problem, :description, :website)
    @organization = Organization.find(params[:id])
    @organization.destroy
    redirect_to dashboard_host_path
    # redirect_to organization_path(@organization)
  end
end
