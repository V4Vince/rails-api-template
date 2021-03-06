class StoriesController < ProtectedController
  before_action :set_story, only: [:show, :update, :destroy]

  # GET /stories
  # GET /stories.json
  def index
    @stories = current_user.stories

    render json: @stories
  end

  def showindex
    @stories = Stories.all

    render json: @stories
  end

  # GET /stories/1
  # GET /stories/1.json
  def show
    render json: Story.find(params[:id])

    render json: @story
  end

  # POST /stories
  # POST /stories.json
  def create
    @story = current_user.stories.build(story_params)

    if @story.save
      render json: @story, status: :created, location: @story
    else
      render json: @story.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /stories/1
  # PATCH/PUT /stories/1.json
  def update
    @story = Story.find(params[:id])

    if @story.update(story_params)
      head :no_content
    else
      render json: @story.errors, status: :unprocessable_entity
    end
  end

  # DELETE /stories/1
  # DELETE /stories/1.json
  def destroy
    @story.destroy

    head :no_content
  end

  private

    def set_story
      @story = Story.find(params[:id])
    end

    def story_params
      params.require(:story).permit(:title, :body)
    end
end
