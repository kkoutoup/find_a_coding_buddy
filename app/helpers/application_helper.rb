module ApplicationHelper
  def check_image_exists(technology)
    if technology.name.include?"."
      technology.name = technology.name.downcase.gsub!(/[^0-9A-Za-z]/, '') 
    else
      technology.name = technology.name.downcase
    end
    path = Rails.root.join("app", "assets", "images", "technology_icons_png", "#{ technology.name }.png")
    File.exist?(path) ? asset_path("technology_icons_png/#{ technology.name }.png") : asset_path("technology_icons_png/coding.png")
  end
end
