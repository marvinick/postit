module ApplicationHelper
  def fix_url(url)
    url.starts_with?("http") ? url : "http://#{url}"
  end

  def nice_date(dt)
    dt= dt.in_time_zone(current_user.time_zone || "Time.zone.name") if logged_in?
    dt.strftime("%m/%d/%Y 1:%M%P %Z") # 03/14/2013 9:09pm UTC
  end

  def default_time_zone
    logged_in? && !current_user.time_zone.nil? ? current_user.time_zone : Time.zone.name
  end
end
