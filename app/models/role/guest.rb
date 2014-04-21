class Role::Guest < User
  def can?(action, controller)
    @controller, @action = controller, action

    can_do? controllers: [:about, :contacts, :production, :main] or
    can_do? controllers: [:sessions] or
    can_do? controllers: [:services, :type_of_products], actions: [:index, :show] or
    can_do? controllers: [:products],                    actions: [:index, :show] or
    can_do? controllers: [:orders],                      actions: [:new, :create] or
    can_do? controllers: [:debtors],                     actions: [:show]
  end
end