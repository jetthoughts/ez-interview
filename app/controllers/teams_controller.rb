class TeamsController < ApplicationController
  self.current_menu_item = 'Teams'

  before_action :set_team, only: [:show, :edit, :update, :destroy,
                                  :create_member, :switch]

  # GET /teams
  # GET /teams.json
  def index
    @teams = current_user.teams
  end

  # GET /teams/1
  # GET /teams/1.json
  def show
  end

  # GET /teams/new
  def new
    @team = Team.new
  end

  # GET /teams/1/edit
  def edit
  end

  # POST /teams
  # POST /teams.json
  def create
    @team = Team.new(team_params)


    respond_to do |format|
      if @team.save
        @team.create_owner(current_user)
        format.html { redirect_to @team, notice: 'Team was successfully created.' }
        format.json { render :show, status: :created, location: @team }
      else
        format.html { render :new }
        format.json { render json: @team.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /teams/1
  # PATCH/PUT /teams/1.json
  def update
    respond_to do |format|
      if @team.update(team_params)
        format.html { redirect_to @team, notice: 'Team was successfully updated.' }
        format.json { render :show, status: :ok, location: @team }
      else
        format.html { render :edit }
        format.json { render json: @team.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /teams/1
  # DELETE /teams/1.json
  def destroy
    @team.destroy
    respond_to do |format|
      format.html { redirect_to teams_url, notice: 'Team was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  # GET /teams/new_member
  def new_member
  end

  # POST /teams/create_member
  def create_member
    user = User.find_by(email: params[:invite][:email])
    # TODO: validate email

    if user
      @team.invite_member(user)
    else
      # send invite to application
    end
    redirect_to @team
  end

  def switch
    session[:current_team] = @team.id
    redirect_to :back
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_team
      @team = Team.find(params[:id] || params[:team_id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def team_params
      params.require(:team).permit(:name)
    end
end
