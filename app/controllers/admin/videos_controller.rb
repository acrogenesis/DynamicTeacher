class Admin::VideosController < Admin::ApplicationController
  before_action :set_video, only: [:edit, :update, :destroy]

  def new
    @video = Video.new
  end

  def create
    @video = Video.new(video_params)
    authorize @video

    if @video.save
      redirect_to admin_dashboard_path(anchor: 'videos')
    else
      redirect_to admin_dashboard_path(anchor: 'videos')
    end
  end

  def update
    authorize @video
    if @video.update(video_params)
      redirect_to admin_dashboard_path(anchor: 'videos')
    else
      redirect_to admin_dashboard_path(anchor: 'videos')
    end
  end

  def destroy
    authorize @video
    @video.destroy
  end

  private

  def set_video
    @video = Video.find(params[:id])
  end

  def video_params
    params.require(:video).permit(:subject, :url, :title)
  end
end
