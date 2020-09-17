module ApplicationHelper
  def check_image_exists(technology)
    if technology.name.include?"."
      technology.name = technology.name.downcase.gsub!(/[^0-9A-Za-z]/, '')
    else
      technology.name = technology.name.downcase
    end
    path = Rails.root.join("app", "assets", "images", "technologies_icons", "#{ technology.name }.svg")
    File.exist?(path) ? asset_path("technologies_icons/#{ technology.name }.svg") : asset_path("technologies_icons/logo-missing-img.png")
  end

  def render_users(applications)
    users = applications.map { |application| User.find(application.user_id) }
    output = ""
    users.each do |user|
      output += "<li>#{user.first_name} #{user.last_name}</li>"
    end
    output.html_safe
  end
end
