module ReviewHelper
  def user_info(review)
    user = User.find(review.user_id)
    "#{ user.first_name } #{ user.last_name }"
  end
end