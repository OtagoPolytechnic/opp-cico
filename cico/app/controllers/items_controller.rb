class ItemsController < ApplicationController
  
  # Check the user is an admin
  before_action :confirm_admin
  before_action :set_item, only: [:show, :edit, :update, :destroy]

  # GET /items
  # GET /items.json
  def index
    @items = Item.oldest_first
  end

  # GET /items/1
  # GET /items/1.json
  def show
  end

  # GET /items/new
  def new
    @item = Item.new
    @items = Item.CheckOut.where(returned_at: !nil)
  end

  # GET /items/1/edit
  def edit
  end

  # POST /items
  # POST /items.json
  def create
    @item = Item.new(item_params)
    @item_types = ItemType.not_retired

    respond_to do |format|
      if @item.save
        format.html { redirect_to @item, notice: 'Item was successfully created.' }
        format.json { render :show, status: :created, location: @item }
      else
        format.html { render :new }
        format.json { render json: @item.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /items/1
  # PATCH/PUT /items/1.json
  def update
    respond_to do |format|
      if @item.update(item_params)
        format.html { redirect_to @item, notice: 'Item was successfully updated.' }
        format.json { render :show, status: :ok, location: @item }
      else
        format.html { render :edit }
        format.json { render json: @item.errors, status: :unprocessable_entity }
      end
    end
  end

  # Retire form
  def retire
    @item = set_item

    # Checks if item is already retired
    if (@item.retired_at != nil)
      redirect_to item_path, alert: 'Item is already retired!'
    end
  end

  # Unretire form
  def unretire
    @item = set_item

    # Checks if item is already unretired
    if (@item.retired_at == nil)
      redirect_to item_path, alert: 'Item is already unretired!'
    end
  end

  # Sets item to be unretired
  def set_unretire
    @item = set_item

    # Checks if the item retired at is not nil and unretire is yes
    if (@item.retired_at != nil && params[:unretire] == 'yes')

      # Unset retire date
      @item.retired_at = nil

      # Save item
      @item.save

      # Redirects to item show page
      redirect_to @item, notice: 'Item was successfully unretired.'
    else
      # Redirects to items index
      redirect_to item_path, alert: 'There was an error!'
    end
  end

  private

    # Use callbacks to share common setup or constraints between actions.
    def set_item
      @item = Item.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def item_params
      params.require(:item).permit(:name, :price, :asset_num, :notes, :retired_at, :item_type_id)
    end
    
end
