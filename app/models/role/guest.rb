class Role::Guest < User
  def can?(action, controller)
    @controller, @action = controller, action

    can_do? controllers: [:static_pages], actions: [:about, :contacts, :production, :main] or
    can_do? controllers: [:sessions] or
    can_do? controllers: [:services],         actions: [:index, :show] or
    can_do? controllers: [:type_of_products], actions: [:index, :show] or
    can_do? controllers: [:products],         actions: [:index, :show] or
    can_do? controllers: [:orders],           actions: [:new, :create] or
    can_do? controllers: [:debtors],          actions: [:show]
  end
end
