class Admin::VideosController < ApplicationController
  before_action :set_video, only: [:edit, :update, :destroy]

  def new
    @video = Video.new
  end

  def create
    @video = Video.new(video_params)

    if @video.save
      redirect_to admin_dashboard_path(anchor: 'videos')
    else
      redirect_to admin_dashboard_path(anchor: 'videos')
    end
  end

  def update
    if @video.update(video_params)
      redirect_to admin_dashboard_path(anchor: 'videos')
    else
      redirect_to admin_dashboard_path(anchor: 'videos')
    end
  end

  def destroy
    @video.destroy
  end

  private

  def set_video
    @video = Video.find(params[:id])
  end

  def video_params
    video_code = %r{^.*(youtu.be\/|v\/|u\/\w\/|embed\/|watch\?v=|\&v=)([^#\&\?]*).*}.match(params[:video][:url])[2]
    params[:video][:url] = "//www.youtube.com/embed/#{video_code}"
    params.require(:video).permit(:subject, :url, :title)
  end
end
