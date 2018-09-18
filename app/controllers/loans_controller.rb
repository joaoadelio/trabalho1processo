class LoansController < ApplicationController
  before_action :set_loan, only: [:show, :edit, :update, :destroy]

  # GET /loans
  # GET /loans.json
  def index
    @loans = Loan.all
  end

  # GET /loans/1
  # GET /loans/1.json
  def show

  end

  def devolver
    @loan = Loan.find(params[:id])
    @book = Book.find(@loan.book_id)
    @book.active = true
    @book.save
    @devolution = Devolution.new
    @devolution.devolutionDate = Time.now
    @loan.devolution = @devolution
    @loan.save
    redirect_to params[:redirect], notice: 'Devolução realizada com sucesso' unless params[:redirect].blank?
    redirect_to @loan, notice: 'Devolução realizada com sucesso' unless !params[:redirect].blank?
  end

  # GET /loans/new
  def new
    @loan = Loan.new
  end

  # GET /loans/1/edit
  def edit
  end

  # POST /loans
  # POST /loans.json
  def create
    @loan = Loan.new(loan_params)

    def reserva
      @livre = true
      @reservas = Booking.all.where(:book_id => @loan.book_id)

      @reservas.each do |reserva|

        if( reserva.bookingStartDate <= @loan.loanDate && @loan.loanDate <= reserva.bnookigEndDate)
          @livre = false
          break
        end

        if( reserva.bookingStartDate <= @loan.returnDate && @loan.returnDate <= reserva.bnookigEndDate)
          @livre = false
          break
        end

        if( reserva.bookingStartDate >= @loan.loanDate && reserva.bnookigEndDate <= @loan.returnDate )
          @livre = false
          break
        end

      end
      return @livre
    end
    respond_to do |format|

      if(!reserva)
        format.html { redirect_to loans_path, notice: 'Há uma RESERVA deste livro para este período.' }
      else
        @book = Book.find(@loan.book_id)
        @book.active = false
        @book.save


        if @loan.save
          format.html { redirect_to @loan, notice: 'Loan was successfully created.' }
          format.json { render :show, status: :created, location: @loan }
        else
          format.html { render :new }
          format.json { render json: @loan.errors, status: :unprocessable_entity }
        end
      end
    end
  end

  # PATCH/PUT /loans/1
  # PATCH/PUT /loans/1.json
  def update
    @book = Book.find(@loan.book_id)
    @book.active = false
    @book.save
    respond_to do |format|
      if @loan.update(loan_params)
        format.html { redirect_to @loan, notice: 'Loan was successfully updated.' }
        format.json { render :show, status: :ok, location: @loan }
      else
        format.html { render :edit }
        format.json { render json: @loan.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /loans/1
  # DELETE /loans/1.json
  def destroy
    @book = Book.find(@loan.book_id)
    @book.active = true
    @book.save
    @loan.destroy
    respond_to do |format|
      format.html { redirect_to loans_url, notice: 'Loan was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_loan
      @loan = Loan.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def loan_params
      params.require(:loan).permit(:loanDate, :returnDate, :user_id, :book_id)
    end
end
