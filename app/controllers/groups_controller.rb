class GroupsController < ApplicationController
  before_action :set_group, only: [:show, :edit, :update, :destroy]

  # GET /groups
  # GET /groups.json
  def index
    @groups = Group.all
  end

  # GET /groups/1
  # GET /groups/1.json
  def show
  end

  # GET /groups/new
  def new
    @group = Group.new
  end

  # GET /groups/1/edit
  def edit
  end

  # POST /groups
  # POST /groups.json
  def create
    @group = Group.new(group_params)


    @group.owner_id = current_user.id

    respond_to do |format|
      if @group.save
        format.html { redirect_to @group}
        format.json { render :show, status: :created, location: @group }
      else
        format.html { render :new }
        format.json { render json: @group.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /groups/1
  # PATCH/PUT /groups/1.json
  def update
    respond_to do |format|
      if @group.update(group_params)
        format.html { redirect_to @group, notice: 'Group was successfully updated.' }
        format.json { render :show, status: :ok, location: @group }
      else
        format.html { render :edit }
        format.json { render json: @group.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /groups/1
  # DELETE /groups/1.json
  def destroy
    @group.destroy
    respond_to do |format|
      format.html { redirect_to groups_url }
      format.json { head :no_content }
    end
  end
  def add_user_request_to_group
    @group = Group.find(params[:group_id])
    @user = User.find_by_id(current_user.id)
    @subscription = Subscription.find_by_user_id_and_group_id(current_user.id,@group.id)
    if @subscription
      puts "subscription exists already"
    else
      @group.users << @user
    end
    @subscription = Subscription.find_by_user_id_and_group_id(current_user.id,@group.id)
    @subscription.accepted = false
    @subscription.save
    redirect_to @group
  end
  def remove_request_from_group
    @group = Group.find(params[:group_id])
    @user = User.find_by_id(current_user.id)
    @group.users.delete(@user)
    @group.save
    redirect_to @group
  end

  def accept_request
    @group = Group.find(params[:group_id])
    @user = User.find_by_id(current_user.id)
    @subscription = Subscription.find_by_user_id_and_group_id(current_user.id,@group.id)
    @subscription.accepted = true
    @subscription.save
    redirect_to @group
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_group
      @group = Group.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def group_params
      params.require(:group).permit(:name, :capacity)
    end
end
