class TeamMembershipsController < ApplicationController
  before_action :set_team_membership, only: [:show, :edit, :update, :destroy]

  # GET /team_memberships
  # GET /team_memberships.json
  def index
    @team_memberships = current_user.team_memberships.where(status: 'pending')
  end

  # GET /team_memberships/1
  # GET /team_memberships/1.json
  def show
  end

  # GET /team_memberships/new
  def new
    @team_membership = TeamMembership.new
  end

  # GET /team_memberships/1/edit
  def edit
  end

  # POST /team_memberships
  # POST /team_memberships.json
  def create
    @team_membership = TeamMembership.new(team_membership_params)

    respond_to do |format|
      if @team_membership.save
        format.html { redirect_to @team_membership, notice: 'Team membership was successfully created.' }
        format.json { render :show, status: :created, location: @team_membership }
      else
        format.html { render :new }
        format.json { render json: @team_membership.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /team_memberships/1
  # PATCH/PUT /team_memberships/1.json
  def update
    respond_to do |format|
      if @team_membership.update(team_membership_params)
        format.html { redirect_to @team_membership, notice: 'Team membership was successfully updated.' }
        format.json { render :show, status: :ok, location: @team_membership }
      else
        format.html { render :edit }
        format.json { render json: @team_membership.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /team_memberships/1
  # DELETE /team_memberships/1.json
  def destroy
    @team_membership.destroy
    respond_to do |format|
      format.html { redirect_to team_memberships_url, notice: 'Team membership was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def join
    @team = Team.find(params[:id])
    @team.confirm_member(current_user)
    redirect_to @team
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_team_membership
      @team_membership = TeamMembership.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def team_membership_params
      params.fetch(:team_membership, {})
    end
end
