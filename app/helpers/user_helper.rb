module UserHelper
  def render_personal_summary(user)
    user.personal_summary? ? user.personal_summary.truncate(150, separator: ' ') : "This buddy hasn't filled out their personal summary yet 😢"
  end

  def dashboard_personal_summary(user)
    user.personal_summary? ? user.personal_summary.truncate(250, separator: ' ') : "To make the most out of Code Buddies remember to add your personal summary"
  end

  def user_photo(user)
    if user.photo.attached?
      user.photo
    else
      'missing-avatar-female-200x200.png'
    end
  end
end
