class BookingsController < ApplicationController
  before_action :set_booking, only: [:show, :edit, :update, :destroy]

  # GET /bookings
  # GET /bookings.json
  def index
    @bookings = Booking.all
  end

  # GET /bookings/1
  # GET /bookings/1.json
  def show
  end

  # GET /bookings/new
  def new
    @booking = Booking.new
  end

  def converterReserva
    @reserva = Booking.find(params[:id])
    @emprestimo = Loan.new
    @emprestimo.book_id = @reserva.book_id
    @emprestimo.loanDate = @reserva.bookingStartDate
    @emprestimo.returnDate = @reserva.bnookigEndDate
    @emprestimo.created_at = @reserva.created_at
    @emprestimo.updated_at = Time.now
    @emprestimo.user_id = @reserva.user_id

    @emprestimo.save
    @reserva.destroy

    redirect_to loans_path, notice: 'Reserva convertida com sucesso realizada com sucesso'
  end

  # GET /bookings/1/edit
  def edit
  end

  # POST /bookings
  # POST /bookings.json
  def create
    @booking = Booking.new(booking_params)

    # metodo para verificar se possui reserva para aquele período
    def reserva
      @livre = true
      @reservas = Booking.all.where(:book_id => @booking.book_id)

      @reservas.each do |reserva|

        if( reserva.bookingStartDate <= @booking.bookingStartDate && @booking.bookingStartDate <= reserva.bnookigEndDate)
          @livre = false
          break
        end

        if( reserva.bookingStartDate <= @booking.bnookigEndDate && @booking.bnookigEndDate <= reserva.bnookigEndDate)
          @livre = false
          break
        end

        if( reserva.bookingStartDate >= @booking.bookingStartDate && reserva.bnookigEndDate <= @booking.bnookigEndDate )
          @livre = false
          break
        end

      end
      return @livre
    end
    #fim do método

    # metodo para verificar se possui empréstimo para aquele período
    def emprestimo
      @livre = true
      @emprestimos = Loan.all.where(:book_id => @booking.book_id)

      @emprestimos.each do |emprestimo|

        if( emprestimo.loanDate <= @booking.bookingStartDate && @booking.bookingStartDate <= emprestimo.returnDate)
          @livre = false
          break
        end

        if( emprestimo.loanDate <= @booking.bnookigEndDate && @booking.bnookigEndDate <= emprestimo.returnDate)
          @livre = false
          break
        end

        if( emprestimo.loanDate >= @booking.bookingStartDate && emprestimo.bnookigEndDate <= @booking.returnDate )
          @livre = false
          break
        end

      end
      return @livre
    end
    #fim do método

    respond_to do |format|
      if(!reserva)
        format.html { redirect_to bookings_path, notice: 'Já existe uma RESERVA deste livro para este período.' }
      elsif (!emprestimo)
        format.html { redirect_to bookings_path, notice: 'Já existe um EMPRÉSTIMO deste livro para este período.' }
      else
        if @booking.save
          format.html { redirect_to @booking, notice: 'Booking was successfully created.' }
          format.json { render :show, status: :created, location: @booking }
        else
          format.html { render :new }
          format.json { render json: @booking.errors, status: :unprocessable_entity }
        end
      end

    end
  end

  # PATCH/PUT /bookings/1
  # PATCH/PUT /bookings/1.json
  def update
    respond_to do |format|
      if @booking.update(booking_params)
        format.html { redirect_to @booking, notice: 'Booking was successfully updated.' }
        format.json { render :show, status: :ok, location: @booking }
      else
        format.html { render :edit }
        format.json { render json: @booking.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /bookings/1
  # DELETE /bookings/1.json
  def destroy
    @booking.destroy
    respond_to do |format|
      format.html { redirect_to bookings_url, notice: 'Booking was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_booking
      @booking = Booking.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def booking_params
      params.require(:booking).permit(:bookingStartDate, :bnookigEndDate, :user_id, :book_id)
    end
end
