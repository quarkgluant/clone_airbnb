module ApplicationHelper
  def avatar_url(user)
    if avatar.user.present?
      user.avatar.url
    else
      'default_image.png'
    end
  end
end
