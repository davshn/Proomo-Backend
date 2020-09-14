require 'net/http'
module ColletModule
    def self.generate_token
        request_body = {
            EntityCode: ENV["ENTITY_CODE"],
            ApiKey: ENV["API_KEY"]
        }
        url = URI(ENV["URL"]+'/app_express/api/getSessionToken')
        https = Net::HTTP.new(url.host, url.port)
        https.use_ssl = true
        request = Net::HTTP::Post.new(url)
        request["Content-Type"] = "application/json"
        request.body = request_body.to_json
        response = https.request(request)
        return { error: true , status: 422 } if response.code.to_i != 200
    
        token = JSON.parse(response.body)
        return { token: token }
    end

    
    def self.create_transaction_payment(purchace_id,value,reference_array)
        last_token = self.generate_token
        session_token =  last_token[:token]['SessionToken']

        request_body = {
            EntityCode: ENV["ENTITY_CODE"],
            SessionToken: session_token,
            ApiKey: ENV["API_KEY"],
            SrvCode: ENV["SRV_CODE"],
            TransValue: value,
            SrvCurrency: 'COP',
            UrlResponse: ENV["URL_RESPONSE"],
            LangCode: 'ES',
            Invoice: purchace_id,
            ReferenceArray: reference_array

        }
        url = URI(ENV["URL"]+'/app_express/api/createTransactionPayment')
        https = Net::HTTP.new(url.host, url.port)
        https.use_ssl = true
        request = Net::HTTP::Post.new(url)
        request["Content-Type"] = "application/json"
        request.body = request_body.to_json
        response = https.request(request)
        return { error: true , status: 422 } if response.code.to_i != 200
    
        data = JSON.parse(response.body)
        return { data: data }
    end
    

    def self.get_transaction_information(ticket_id)
        last_token = self.generate_token
        session_token =  last_token[:token]['SessionToken']

        request_body = {
            EntityCode: ENV["ENTITY_CODE"],
            SessionToken: session_token,
            TicketId: ticket_id
        }
        url = URI(ENV["URL"]+'/app_express/api/getTransactionInformation')
        https = Net::HTTP.new(url.host, url.port)
        https.use_ssl = true
        request = Net::HTTP::Post.new(url)
        request["Content-Type"] = "application/json"
        request.body = request_body.to_json
        response = https.request(request)
        return { error: true , status: 422 } if response.code.to_i != 200
    
        data = JSON.parse(response.body)
        return { data: data }
    end


  
end
  