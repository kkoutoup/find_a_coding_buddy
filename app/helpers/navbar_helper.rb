module NavbarHelper
  def check_avatar_photo_exists
    if current_user.photo.present?
      image_tag current_user.photo
      # @photo = current_user.photo
    else
      image_tag "technologies_icons/logo-missing-img.png"
    end
  end
end

 # class: "avatar dropdown-toggle", id: "navbarDropdown", data: { toggle: "dropdown" }, 'aria-haspopup': true, 'aria-expanded': false
