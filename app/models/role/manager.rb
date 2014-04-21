class Role::Manager < User
  def can?(action, controller)
    @controller, @action = controller, action

    can_do? controllers: [:sessions, :services, :type_of_products, :products, :orders]
  end
end