class Admin::AccountsController < AdminController
  def index
    @accounts = current_group.accounts.paginate(:page => params[:page], per_page: 20).order('id DESC')
  end

  def new
    @account = current_group.accounts.new(account_params)
  end

  def create
    params[:account][:is_active] ||= false
    params[:account][:group_names] = "normal"
    @account = current_group.accounts.new(account_params)

    if @account.save
      redirect_to action: 'index', flash: { :success => "创建成功！" }
    else
      render "new", params: account_params, flash: { :error => @account.errors.full_messages[0] }
    end
  end

  def edit
    @account = current_group.accounts.find(params[:id])
  end

  def update
    params[:account][:is_active] ||= false

    @account = current_group.accounts.find(params[:id])
    @account.update_attributes(account_params)

    redirect_to action: 'index', flash: { :success => "创建成功！"}
  end

  def show
    @account = current_group.accounts.find(params[:id])
  end

  private

  def current_group
    Group.find_by_id(Group::NORMAL_ID)
  end

  def account_params
    return {} unless params[:account]
    params.require(:account).permit(:name, :email, :is_active, :password, :password_confirmation)
  end
end
