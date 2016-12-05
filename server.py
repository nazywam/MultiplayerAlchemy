from random import randint
from SimpleWebSocketServer import SimpleWebSocketServer, WebSocket


def generateBoard(width, height):
    d = []
    for y in range(height):
        for x in range(width):
            d.append((randint(0, 3), randint(0, 3)))
    return d


clients = []
board = generateBoard(8, 8)
a = 1




class SimpleChat(WebSocket):


    def rotateTile(self, x, y):
        pass
        #global board
        #board[y*8+x][1] = (board[y*8+x][1] + 1)%4

    #client sent move
    def handleMessage(self):
        print(self.data)

        #sendMap
        if(self.data[0] == "S"):
          self.sendMessage(unicode(("S"+','.join(str(x[0])+"."+str(x[1]) for x in board))))

        #send out moves
        elif(self.data[0] == "M"):
            payload = self.data[1:].split(",")

            self.rotateTile(int(payload[0]), int(payload[1]))

            for client in clients:
                if client != self:
                    client.sendMessage(unicode(self.data))

  #client connected
    def handleConnected(self):
        print self.address, 'connected'
        clients.append(self)
     

    def handleClose(self):
        print self.address, 'closed'
        clients.remove(self)



print(board)

server = SimpleWebSocketServer('', 9000, SimpleChat)
server.serveforever()