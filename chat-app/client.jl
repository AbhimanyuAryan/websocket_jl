using HTTP
using JSON

function start_client(ws)
    println("Enter your name: ")
    clientName = readline()
    println("You can start typing your messages now. Press Ctrl+C to quit.")
    while true
        write(stdout, "> ")
        message = readline()
        
        data = Dict("clientName" => clientName, "message" => message)
        json_data = JSON.json(data)
        
        HTTP.WebSockets.send(ws, json_data)
    end
end

HTTP.WebSockets.open(start_client, "ws://127.0.0.1:8080")
