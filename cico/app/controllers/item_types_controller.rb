class ItemTypesController < ApplicationController
  
  # Check the user is an admin
  before_action :confirm_admin
  before_action :set_item_type, only: [:show, :edit, :update, :destroy]

  # GET /item_types
  # GET /item_types.json
  def index
    @item_types = ItemType.oldest_first
  end

  # GET /item_types/1
  # GET /item_types/1.json
  def show
  end

  # GET /item_types/new
  def new
    @item_type = ItemType.new
  end

  # GET /item_types/1/edit
  def edit
    @item_types = ItemType.all
  end

  # POST /item_types
  # POST /item_types.json
  def create
    @item_type = ItemType.new(item_type_params)

    respond_to do |format|
      if @item_type.save
        format.html { redirect_to @item_type, notice: 'Item type was successfully created.' }
        format.json { render :show, status: :created, location: @item_type }
      else
        format.html { render :new }
        format.json { render json: @item_type.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /item_types/1
  # PATCH/PUT /item_types/1.json
  def update
    respond_to do |format|
      if @item_type.update(item_type_params)
        format.html { redirect_to @item_type, notice: 'Item type was successfully updated.' }
        format.json { render :show, status: :ok, location: @item_type }
      else
        format.html { render :edit }
        format.json { render json: @item_type.errors, status: :unprocessable_entity }
      end
    end
  end

  def retire
    @item_type = set_item_type

    # Checks if item type is already retired
    if (@item_type.retired_at != nil)
      redirect_to item_types_path, alert: 'Item type is already retired!'
    end
  end

  def unretire
    @item_type = set_item_type

    # Checks if item type is already retired
    if (@item_type.retired_at == nil)
      redirect_to item_types_path, alert: 'Item type is already unretired!'
    end
  end

  def set_unretire
    @item_type = set_item_type

    if (@item_type.retired_at != nil && params[:unretire] == 'yes')

      @item_type.retired_at = nil

      @item_type.save

      redirect_to @item_type, notice: 'Item type was successfully unretired.'
    else
      redirect_to item_types_path, alert: 'There was an error!'
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_item_type
      @item_type = ItemType.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def item_type_params
      params.require(:item_type).permit(:name, :description, :notes, :retired_at)
    end
end
