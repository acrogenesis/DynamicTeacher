class Admin::GroupsController < ApplicationController
  before_action :set_group, only: [:show, :edit, :update, :destroy]

  def new
    @group = Group.new
  end

  def edit
  end

  def create
    @group = Group.new(group_params)

    if @group.save
      redirect_to admin_dashboard_path(anchor: 'grupos')
    else
      redirect_to admin_dashboard_path(anchor: 'grupos')
    end
  end

  def update
    if @group.update(group_params)
      redirect_to admin_dashboard_path(anchor: 'grupos')
    else
      redirect_to admin_dashboard_path(anchor: 'grupos')
    end
  end

  def destroy
    @group.destroy
  end

  private

  def set_group
    @group = Group.find(params[:id])
  end

  def group_params
    params.require(:group).permit(:name, :schedule)
  end
end
