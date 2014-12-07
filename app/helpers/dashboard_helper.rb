module DashboardHelper
  def iframe_video(url)
    "<iframe width='640' height='360' src='#{url}?rel=0' frameborder='0' allowfullscreen></iframe>"
  end
end
