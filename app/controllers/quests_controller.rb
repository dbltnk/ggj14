class QuestsController < ApplicationController
  before_action :set_quest, only: [:show, :edit, :update, :destroy]

  # GET /quests
  # GET /quests.json
  def index
    @quests = Quest.all
  end

  # GET /quests/1
  # GET /quests/1.json
  def show
	@quest = Quest.find(params[:id])
	cookies.permanent[:visited]="done"
	if !cookies.permanent[@quest.id] then
		cookies.permanent[@quest.id]="visited"
	end
  end
  
  def accept
#	  puts YAML::dump(@id)
#	  puts YAML::dump(@quest)
	@quests = Quest.all
	@quest = Quest.find(params[:id])
	cookies.permanent[:current_quest]=@quest
	cookies.permanent[:current_quest_id]=@quest.id
	cookies.permanent[:current_quest_name]=@quest.name
	render "index"
end

  def cancel
	@quests = Quest.all
	@quest = Quest.find(params[:id])
	if cookies[:current_quest] then
		cookies.delete :current_quest
	end
	if cookies[:current_quest_id] then
		cookies.delete :current_quest_id
	end
	if cookies[:current_quest_name] then
		cookies.delete :current_quest_name
	end
	render "index"
end

  def done
	@quest = Quest.find(params[:id])
	
	if cookies[:current_quest_id] then
		cookies.permanent[:done]="yeah"
		cookies.permanent[cookies[:current_quest_id]]="done"
	end
	
	if cookies[:current_quest] then
		cookies.delete :current_quest
	end
	if cookies[:current_quest_id] then
		cookies.delete :current_quest_id
	end
	if cookies[:current_quest_name] then
		cookies.delete :current_quest_name
	end
	render "show"
end

  # GET /quests/new
  def new
	return
      @quest = Quest.new
  end

  # GET /quests/1/edit
  def edit
  end

  # POST /quests
  # POST /quests.json
  def create
      return
    @quest = Quest.new(quest_params)

    respond_to do |format|
      if @quest.save
        format.html { redirect_to @quest, notice: 'Quest was successfully created.' }
        format.json { render action: 'show', status: :created, location: @quest }
      else
        format.html { render action: 'new' }
        format.json { render json: @quest.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /quests/1
  # PATCH/PUT /quests/1.json
  def update
      return
    respond_to do |format|
      if @quest.update(quest_params)
        format.html { redirect_to @quest, notice: 'Quest was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @quest.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /quests/1
  # DELETE /quests/1.json
  def destroy
      return
    @quest.destroy
    respond_to do |format|
      format.html { redirect_to quests_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_quest
      @quest = Quest.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def quest_params
      params.require(:quest).permit(:name, :description, :imgurl)
    end
end
