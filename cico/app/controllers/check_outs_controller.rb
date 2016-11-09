class CheckOutsController < ApplicationController
  
  # Check the user is an admin
  before_action :confirm_admin
  before_action :set_check_out, only: [:show, :edit, :update, :destroy]

  # GET /check_outs
  # GET /check_outs.json
  def index
    @check_outs = CheckOut.oldest_first
  end

  # GET /check_outs/1
  # GET /check_outs/1.json
  def show
  end

  # GET /check_outs/new
  def new
    @check_out = CheckOut.new
  end

  # GET /check_outs/1/edit
  def edit
  end

  # POST /check_outs
  # POST /check_outs.json
  def create
    @check_out = CheckOut.new(check_out_params)

    respond_to do |format|
      if @check_out.save
        format.html { redirect_to @check_out, notice: 'Check out was successfully created.' }
        format.json { render :show, status: :created, location: @check_out }
      else
        format.html { render :new }
        format.json { render json: @check_out.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /check_outs/1
  # PATCH/PUT /check_outs/1.json
  def update
    respond_to do |format|
      if @check_out.update(check_out_params)
        format.html { redirect_to @check_out, notice: 'Check out was successfully updated.' }
        format.json { render :show, status: :ok, location: @check_out }
      else
        format.html { render :edit }
        format.json { render json: @check_out.errors, status: :unprocessable_entity }
      end
    end
  end

  # Return form
  def return
    @check_out = set_check_out

    # Checks if check_out is already returned
    if (@check_out.returned_at != nil)
      redirect_to check_out_path, alert: 'Check out already returned!'
    end
  end

  private
    
    # Use callbacks to share common setup or constraints between actions.
    def set_check_out
      @check_out = CheckOut.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def check_out_params
      params.require(:check_out).permit(:item_id, :user_id, :returned_at)
    end

end
