class PaymentMailer < ApplicationMailer
  default from: 'tweniadmon@gmail.com'


  def confirm_online_promo(coupon_name, phone, email, name, commerce_email)
    @coupon_name = coupon_name
    @phone = phone
    @email = email
    @name = name
    @commerce_email = commerce_email
    mail(to: ['tweniadmon@gmail.com', @commerce_email],
         subject: 'Confirmación de compra online')
  end

  def confrim_payment(coupon_name, phone, email, name, commerce_email, value)
    @coupon_name = coupon_name
    @phone = phone
    @email = email
    @name = name
    @commerce_email = commerce_email
    @value = value
    mail(to: ['tweniadmon@gmail.com', @commerce_email],
         subject: 'Confirmación de pago')
  end


end

# Example
# InvitationMailer.send_invitation(params['email'], params['begin'], params['end'], data,
#                 params['user_id'], params['time_send'], params['device_id'],
#                 params['user_id_encrypt'],
#                 params['begin_server'].to_datetime.to_i,
#                 params['end_server'].to_datetime.to_i, invited_client.id).deliver_now
