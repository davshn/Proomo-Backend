require 'net/http'
module ColletModule
    def self.generate_token
        Rails.logger.debug("Token!!!!!")
        request_body = {
            EntityCode: 10693, #ENV["ENTITY_CODE"],
            ApiKey: '63706333665352484737487267704C2F306453397637676B6772706953713576', #ENV["API_KEY"]
        }
        url = URI('https://gateway1.ecollect.co/app_express/api/getSessionToken')
        https = Net::HTTP.new(url.host, url.port)
        https.use_ssl = true
        request = Net::HTTP::Post.new(url)
        request["Content-Type"] = "application/json"
        request.body = request_body.to_json
        Rails.logger.debug("Request!!!!!")
        response = https.request(request)
        Rails.logger.debug("Response!!!!!")
        Rails.logger.debug(response)
        return { error: true , status: 422 } if response.code.to_i != 200

        token = JSON.parse(response.body)
        return { token: token }
    end


    def self.create_transaction_payment(purchace_id,value,reference_array)
        Rails.logger.debug("Create transaction!!!!!")
        last_token = self.generate_token
        session_token =  last_token[:token]['SessionToken']
        Rails.logger.debug("Tokens!!!!!")
        Rails.logger.debug(last_token)
        Rails.logger.debug(session_token)
        request_body = {
            EntityCode: 10693, #ENV["ENTITY_CODE"],
            SessionToken: session_token,
            ApiKey: '63706333665352484737487267704C2F306453397637676B6772706953713576', #,ENV["API_KEY"],
            SrvCode: 1001, #ENV["SRV_CODE"],
            TransValue: value,
            SrvCurrency: 'COP',
            #UrlResponse: 'https://7485400c240a.ngrok.io/api/v1/collet_hook',#ENV["URL_RESPONSE"],
            UrlResponse: 'https://tweni.app/api/v1/collet_hook',
            LangCode: 'ES',
            Invoice: purchace_id,
            ReferenceArray: reference_array

        }
        url = URI('https://gateway1.ecollect.co/app_express/api/createTransactionPayment')
        https = Net::HTTP.new(url.host, url.port)
        https.use_ssl = true
        request = Net::HTTP::Post.new(url)
        request["Content-Type"] = "application/json"
        request.body = request_body.to_json
        Rails.logger.debug("Request!!!!!")
        response = https.request(request)
        Rails.logger.debug("Response!!!!!")
        return { error: true , status: 422 } if response.code.to_i != 200

        data = JSON.parse(response.body)
        return { data: data }
    end


    def self.get_transaction_information(ticket_id)
        Rails.logger.debug("Transaction Information!!!!!")
        last_token = self.generate_token
        session_token =  last_token[:token]['SessionToken']
        Rails.logger.debug("Tokens!!!!!")
        request_body = {
            EntityCode: 10693, #ENV["ENTITY_CODE"],
            SessionToken: session_token,
            TicketId: ticket_id
        }
        url = URI('https://gateway1.ecollect.co/app_express/api/getTransactionInformation')
        https = Net::HTTP.new(url.host, url.port)
        https.use_ssl = true
        request = Net::HTTP::Post.new(url)
        request["Content-Type"] = "application/json"
        request.body = request_body.to_json
        Rails.logger.debug("Request!!!!!")
        response = https.request(request)
        Rails.logger.debug("Response!!!!!")
        Rails.logger.debug(response)
        return { error: true , status: 422 } if response.code.to_i != 200

        data = JSON.parse(response.body)
        return { data: data }
    end



end
