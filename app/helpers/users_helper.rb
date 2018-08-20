module UsersHelper
  def puts_confirmed(user)
    if user.confirmed
      asset_path "confirmed.png"
    else
      asset_path "no-confirmed.png"
    end
  end

  def puts_avatar(user)
    if user.avatar.url.match("missing")
      asset_path "person.jpg"
    else
      user.avatar.url
    end
  end

  def puts_status(user)
    case user.status
    when "user"
      "Пользователь"
    when "admin"
      "Администрация"
    when "agent"
      "Агент по недвижимости"
    when "manager"
      "Менеджер по недвижимости"
    when "owner"
      "Владелец"
    when "blogger"
      "Блоггер"
    when "markup"
      "Разметчик"
    end
  end
end
