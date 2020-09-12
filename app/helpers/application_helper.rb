module ApplicationHelper
  def check_image_exists(technology)
    if technology.name.include?"."
      technology.name = technology.name.downcase.gsub!(/[^0-9A-Za-z]/, '') 
    else
      technology.name = technology.name.downcase
    end
    path = Rails.root.join("app", "assets", "images", "technologies_icons", "#{ technology.name }.svg")
    File.exist?(path) ? asset_path("technologies_icons/#{ technology.name }.svg") : asset_path("technologies_icons/code.svg")
  end
end
