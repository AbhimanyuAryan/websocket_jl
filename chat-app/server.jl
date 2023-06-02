using HTTP
using JSON

WebSockets.listen("127.0.0.1", UInt16(8080)) do ws
    try
        # iterate incoming websocket messages
        for msg in ws
            # parse JSON data
            data = JSON.parse(String(msg))

            # extract client name and message
            clientName = data["clientName"]
            message = data["message"]

            # write message to stdout with client name
            println("Received data from ", clientName, ": ", message)
        end
    catch e
        if isa(e, EOFError)
            println("A client has disconnected.")
        else
            rethrow(e)
        end
    end
    # iteration ends when the websocket connection is closed by client or error
end
