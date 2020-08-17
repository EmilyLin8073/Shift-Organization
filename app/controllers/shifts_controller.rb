class ShiftsController < ApplicationController
  before_action :set_shift, only: [:show, :edit, :update, :destroy]
  helper_method :time_difference
  # GET /shifts
  # GET /shifts.json
  def index
    @shifts = Shift.where(:organization_id == current_user.organization_id)
    render :index
  end

  # GET /shifts/1
  # GET /shifts/1.json
  def show
  end

  # GET /shifts/new
  def new
    @shift = Shift.new
  end

  # GET /shifts/1/edit
  def edit
  end

  # POST /shifts
  # POST /shifts.json
  def create
    @shift = Shift.new(shift_params)
    @shift.user_id = current_user.id
    @shift.organization_id = current_user.organization_id

    respond_to do |format|
      if @shift.save
        format.html { redirect_to @shift, notice: 'Shift was successfully created.' }
        format.json { render :show, status: :created, location: @shift }
      else
        format.html { render :new }
        format.json { render json: @shift.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /shifts/1
  # PATCH/PUT /shifts/1.json
  def update
    respond_to do |format|
      if @shift.update(shift_params)
        format.html { redirect_to @shift, notice: 'Shift was successfully updated.' }
        format.json { render :show, status: :ok, location: @shift }
      else
        format.html { render :edit }
        format.json { render json: @shift.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /shifts/1
  # DELETE /shifts/1.json
  def destroy
    # Find the correct shift to delete
    @shift = Shift.find(params[:id])

    respond_to do |format|
    if @shift.destroy
        format.html { redirect_to shifts_url, notice: 'Shift was successfully destroyed.' }
        format.json { head :no_content }
    else
      format.html {redirect_to shifts_url, notice: "Cannot delete shifts"}
      format.json {render json: @shift.errors, status: unprocessable_entity}
      end
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_shift
      @shift = Shift.find(params[:id])
    end

    def time_difference(start, finish)
      TimeDifference.between(start, finish).in_hours
    end

    # Only allow a list of trusted parameters through.
    def shift_params
      params.require(:shift).permit(:user_id, :start, :finish, :break_length, :organization_id)
    end
end
