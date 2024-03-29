class UsersController < ApplicationController
  protect_from_forgery
  before_action :set_user, only: [:show, :edit, :update, :destroy]
  before_filter :skip_password_attribute, only: :update

  $childs_id = 1

  # GET /users
  # GET /users.json
  def index
    @users = User.all
  end

  # GET /users/1
  # GET /users/1.json
  def show
    @user = User.find(params[:id])
  end

  # GET /users/new
  def new
    @user = User.new
  end

  # GET /users/1/edit
  def edit
  end

  # POST /users
  # POST /users.json
  def create
    @user = User.new(user_params)
    if @user.save
      sign_in @user
      redirect_to @user
    else
      render 'new'
    end
  end

  # PATCH/PUT /users/1
  # PATCH/PUT /users/1.json
  def update
    respond_to do |format|
      if @user.update(user_params)
        format.html { redirect_to @user }
        format.json { render :show, status: :ok, location: @user }
      else
        format.html { render :edit }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /users/1
  # DELETE /users/1.json
  def destroy
    @user.destroy
    respond_to do |format|
      format.html { redirect_to users_url }
      format.json { head :no_content }
    end
  end
  def add_child_to_user
    last_child_id= Child.last.id
    @user = User.find(params[:user_id])
    children_list = ["abbc", ]
    new_child_id = $childs_id +1
    if @user.children.any?
      if new_child_id <= last_child_id
         added_child = Child.find_by_id(new_child_id)
         @user.children << added_child 
         $childs_id = $childs_id+1
       end 
    else 
      $childs_id = 0
      new_child_id = $childs_id +1
      if new_child_id <= last_child_id
         added_child = Child.find_by_id(new_child_id)
         @user.children << added_child 
         $childs_id = $childs_id+1
       end
     end


    redirect_to User.find(params[:user_id])

  end
  def remove_child_from_user
    @user = User.find(params[:user_id])
    @child = Child.find(params[:child_id])

    @user.children.delete(@child)
    @user.save
    redirect_to User.find(params[:user_id])
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def user_params
      params.require(:user).permit(:first_name, :lastName, :street, :city, :zipcode, :state, :email, :password,
                                   :password_confirmation)
    end
    def skip_password_attribute
    if params[:password].blank? && params[:password_validation].blank?
      params.except!(:password, :password_validation)
    end
  end
end
# class UsersController < ApplicationController
#   protect_from_forgery
#   before_action :set_user, only: [:show, :edit, :update, :destroy]
# def show
#     @user = User.find(params[:id])
#   end

#    def new
#     @user = User.new
#   end
#   def create
#     @user = User.new(user_params)
#     if @user.save
#       flash[:success] = "Welcome to the Sample App!"
#       redirect_to @user
#     else
#       render 'new'
#     end
#   end

#   private

#     def user_params
#       params.require(:user).permit(:first_name, :lastName, :street, :city, :zipcode, :state, :email, :password,
#                                    :password_confirmation)
#     end
# end

