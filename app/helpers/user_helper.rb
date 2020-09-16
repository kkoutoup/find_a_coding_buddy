module UserHelper
  def render_personal_summary(user)
    user.personal_summary? user.personal_summary : "This buddy hasn's filled out their personal summary yet :-("
  end
end