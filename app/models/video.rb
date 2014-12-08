class Video < ActiveRecord::Base
  before_create :use_embeded_video

  private

  def use_embeded_video
    video_code = %r{^.*(youtu.be\/|v\/|u\/\w\/|embed\/|watch\?v=|\&v=)([^#\&\?]*).*}.match(url)[2]
    self.url = "//www.youtube.com/embed/#{video_code}"
  end
end
