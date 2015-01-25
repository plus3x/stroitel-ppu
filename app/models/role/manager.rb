class Role::Manager < User
  def can?(action, controller)
    @controller, @action = controller, action

	  can_do? controllers: [:static_pages], actions: [:about, :contacts, :production, :main] or
    can_do? controllers: [:sessions, :services, :type_of_products, :products, :orders, :debtors]
  end
end
