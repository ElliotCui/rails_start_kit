class Admin::SuperAccountsController < AdminController
  def index
    @super_accounts = current_group.accounts.paginate(:page => params[:page], per_page: 20).order('id DESC')
  end

  def new
    @super_account = current_group.accounts.new(super_account_params)
  end

  def create
    params[:account][:is_active] ||= false
    params[:account][:group_names] = "admin"
    @super_account = current_group.accounts.new(super_account_params)

    if @super_account.save
      redirect_to action: 'index', flash: { :success => "创建成功！" }
    else
      render "new", params: super_account_params, flash: { :error => @super_account.errors.full_messages[0] }
    end
  end

  def edit
    @super_account = current_group.accounts.find(params[:id])
  end

  def update
    params[:account][:is_active] ||= false

    @super_account = current_group.accounts.find(params[:id])
    @super_account.update_attributes(super_account_params)

    redirect_to action: 'index', flash: { :success => "创建成功！"}
  end

  def show
    @super_account = current_group.accounts.find(params[:id])
  end

  def destroy
    redirect_to action: 'index', flash: { :success => "删除成功！"}
  end

  private

  def current_group
    Group.find_by(id: Group::ADMIN_ID)
  end

  def super_account_params
    return {} unless params[:account]
    params.require(:account).permit(:name, :email, :is_active, :password, :password_confirmation)
  end
end
