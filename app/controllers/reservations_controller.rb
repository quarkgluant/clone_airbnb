class ReservationsController  < ApplicationController
  before_action :authenticate_user!
  
  def create
    @reservation = current_user.reservations.create(reservation_params)
    redirect_to @reservation.room, notice: 'Votre réservation a bien été enregistrée'
  end

   private

  def reservation_params
    params.require(:reservation).permit(:start_date, :end_date, :total, :price)
  end
end