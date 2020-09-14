module ReviewHelper
  def user_initials(review)
    user = User.find(review.user_id)
    "#{user.first_name[0]}#{user.last_name[0]}"
  end

  def user_full_name(review)
    user = User.find(review.user_id)
    "#{ user.first_name } #{ user.last_name }"
  end
end