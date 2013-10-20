class ChannelsController < ApplicationController

  require 'simple-rss'
  require 'open-uri'

  # will only let signed in users pass through
  before_filter :authorize

  before_action :set_channel, only: [:show, :edit, :update, :destroy, :fetch_feeds]

  # GET /channels
  # GET /channels.json
  def index
    @channels = Channel.where(:user_id => current_user.id).to_a
  end

  # GET /channels/1
  # GET /channels/1.json
  def show
    @articles = @channel.articles
  end

  # GET /channels/new
  def new
    @channel = Channel.new
    @title = "New channel"
    @type = "new"
  end

  # GET /channels/1/edit
  def edit
    @title = "Edit channel"
    @type = "edit"
  end

  # POST /channels
  # POST /channels.json
  def create
    @channel = Channel.new(channel_params)

    respond_to do |format|
      if @channel.save
        format.html { redirect_to @channel, notice: 'Channel was successfully created.' }
        format.json { render action: 'show', status: :created, location: @channel }
      else
        format.html { render action: 'new' }
        format.json { render json: @channel.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /channels/1
  # PATCH/PUT /channels/1.json
  def update
    respond_to do |format|
      if @channel.update(channel_params)
        format.html { redirect_to @channel, notice: 'Channel was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @channel.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /channels/1
  # DELETE /channels/1.json
  def destroy
    @channel.destroy
    respond_to do |format|
      format.html { redirect_to channels_url }
      format.json { head :no_content }
    end
  end

  def fetch_feeds

    @rss = SimpleRSS.parse open(@channel.url)
    
    @attributes = {}
    @attributes[:title] = @rss.items.first.title
    @attributes[:link] = @rss.items.first.title
    @attributes[:description] = @rss.items.first.description
    @attributes[:pub_date] = Date.today
    @attributes[:comments] = "Here is where comments go"
    @attributes[:starred] = false
    @attributes[:channel_id] = @channel.id

    @article = Article.new(@attributes)

    @article.save!

  end


  private
    # Use callbacks to share common setup or constraints between actions.
    def set_channel
      @channel = Channel.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def channel_params
      params.require(:channel).permit(:url, :name, :user_id)
    end

    # checks if the user is signed in
    def authorize
      if !user_signed_in?
        redirect_to new_user_session_path
      end
    end
end
