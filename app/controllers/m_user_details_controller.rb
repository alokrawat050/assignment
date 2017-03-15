class MUserDetailsController < ApplicationController
  before_action :set_m_user_detail, only: [:show, :edit, :update, :destroy]

  # GET /m_user_details
  # GET /m_user_details.json
  def index
    @m_user_details = MUserDetail.all
  end

  # GET /m_user_details/1
  # GET /m_user_details/1.json
  def show
  end

  # GET /m_user_details/new
  def new
    @m_user_detail = MUserDetail.new
  end

  # GET /m_user_details/1/edit
  def edit
  end

  # POST /m_user_details
  # POST /m_user_details.json
  def create
    @m_user_detail = MUserDetail.new(m_user_detail_params)

    respond_to do |format|
      if @m_user_detail.save
        format.html { redirect_to @m_user_detail, notice: 'M user detail was successfully created.' }
        format.json { render :show, status: :created, location: @m_user_detail }
      else
        format.html { render :new }
        format.json { render json: @m_user_detail.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /m_user_details/1
  # PATCH/PUT /m_user_details/1.json
  def update
    respond_to do |format|
      if @m_user_detail.update(m_user_detail_params)
        format.html { redirect_to @m_user_detail, notice: 'M user detail was successfully updated.' }
        format.json { render :show, status: :ok, location: @m_user_detail }
      else
        format.html { render :edit }
        format.json { render json: @m_user_detail.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /m_user_details/1
  # DELETE /m_user_details/1.json
  def destroy
    @m_user_detail.destroy
    respond_to do |format|
      format.html { redirect_to m_user_details_url, notice: 'M user detail was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_m_user_detail
      @m_user_detail = MUserDetail.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def m_user_detail_params
      params.require(:m_user_detail).permit(:last_name, :first_name, :last_name_kana, :first_name_kana, :encrypted_birth_date, :encrypted_mobile_no, :encrypted_tel_no)
    end
end
