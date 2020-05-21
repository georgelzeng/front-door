class UsersController < Clearance::UsersController


  def index
  	@users = User.all
  end

  def delete

    @user = User.find(params[:id])
    puts 'penis'
    puts @user
    @user.destroy
    redirect_back(fallback_location: all_users_path)
  end


  def create
    @user = user_from_params

    if @user.nil?
      render template: "users/new"
    elsif @user.save
      sign_in @user
      redirect_back_or url_after_create
    end
  end



  private

  def user_params
    params[:user].permit(:email, :password, :name)
  end

  def user_from_params
    keyword = params[:keyword]

    if keyword == ENV['USER_CODE'] 
      admin = false
    elsif keyword == ENV['ADMIN_CODE']
      admin = true
    else
      return
    end

    email = user_params.delete(:email)
    name = user_params.delete(:name)
    password = user_params.delete(:password)

    Clearance.configuration.user_model.new(user_params).tap do |user|
      user.email = email
      user.password = password
      user.name = name
      user.admin = admin
    end
  end



end
