class Role::Admin < User
  def can?(controller, action)
    true
  end
end