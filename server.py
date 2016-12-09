from random import randint
from SimpleWebSocketServer import SimpleWebSocketServer, WebSocket

#1k

tiles   = [0, 1, 2, 3]
weights = [1, 1, .1, .3, 0]

guesserino = []
for i in range(len(weights)):
    for q in range(int(weights[i]*259)):
        guesserino.append(i)


def generateBoard(width, height):
    d = []
    for y in range(height):
        for x in range(width):
            d.append((tiles[guesserino[randint(0, len(guesserino)-1)]], randint(0, 3)))
    return d


clients = []

width = 16
height = 16

board = generateBoard(width, height)
board[2*width+2] = (4, 0)
a = 1




class Client(WebSocket):
    clientId = -1
    boardX = -1
    boardY = -1

    targetX = -1
    targetY = -1

    def rotateTile(self, x, y):
        global board
        #board[y*8+x][1] = (board[y*8+x][1] + 1)%4

    #client sent move
    def handleMessage(self):
        print(self.data)
          

        #send out moves
        if(self.data[0] == "M"):
            payload = self.data[1:].split(",")

            self.rotateTile(int(payload[0]), int(payload[1]))

            for client in clients:
                if client != self:
                    client.sendMessage(unicode("M{},{}".format(self.clientId, self.data[1:])))

  #client connected
    def handleConnected(self):
        print self.address, 'connected'
        self.clientId = len(clients)
        self.boardX = 8
        self.boardY = 8

        self.targetX = randint(0, width-1)
        self.targetY = randint(0, height-1)

        self.sendMessage(unicode("I"+str(self.clientId)))

        for f in clients:
            if(f != self):
                self.sendMessage(unicode("N{},{},{}".format(str(f.clientId), str(f.boardX), str(f.boardY))))
                f.sendMessage(unicode("N{},{},{}".format(str(self.clientId), str(self.boardX), str(self.boardY))))

        clients.append(self)

        self.sendMessage(unicode(("S"+','.join(str(x[0])+"."+str(x[1]) for x in board))))


        self.sendMessage(unicode("T{},{}".format(str(self.targetX), str(self.targetY))))
        print("{} has target {},{}".format(str(self.clientId), str(self.targetX), str(self.targetY)));
     

    def handleClose(self):
        print self.address, 'closed'
        clients.remove(self)



print(board)

server = SimpleWebSocketServer('', 9000, Client)
server.serveforever()