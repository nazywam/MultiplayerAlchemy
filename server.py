from autobahn.twisted.websocket import WebSocketServerFactory, WebSocketServerProtocol

from twisted.internet import reactor
from random import randint
from twisted.python import log
import sys

MOVES = [
    [0, -1],
    [1, 0],
    [0, 1],
    [-1, 0]
]

class Client(WebSocketServerProtocol):

    def onOpen(self):

        #generate random cooridnates as starters
        self.boardX = randint(0, 16)
        self.boardY = randint(0, 16)

        self.clientId = self.factory.register(self)

        self.sendMessage("I{},{},{}".format(str(self.clientId), str(self.boardX), str(self.boardY)))
        self.sendMessage("S" + ','.join(str(x[0]) + "." + str(x[1]) for x in self.factory.board))


    def onMessage(self, payload, isBinary):
        data = payload[1:]

        #move
        if(payload[0] == "M"):
            if(int(data) == 4):
                self.factory.turnTile(self.boardY * 16 + self.boardX)
            else:
                self.boardX += MOVES[int(data)][0]
                self.boardY += MOVES[int(data)][1]
            self.factory.broadcastMove(self, data)


    def connectionLost(self, reason):
        self.factory.unregister(self)


class Server(WebSocketServerFactory):
    def __init__(self, url):
        WebSocketServerFactory.__init__(self, url)

        self.clients = []
        self.board = self.generateBoard()

        print("Server initiated")

    def register(self, client):
        self.clients.append(client)

        for c in self.clients:
            if c!= client:
                c.sendMessage("N{},{},{}".format(str(len(self.clients)), str(client.boardX), str(client.boardY)))
                client.sendMessage("N{},{},{}".format(str(c.clientId), str(c.boardX), str(c.boardY)))

        return len(self.clients)

    def unregister(self, client):
        for c in self.clients:
            if c != client:
                c.sendMessage("D"+str(c.clientId))
        self.clients.remove(client)

    def turnTile(self, tile):
        self.board[tile] = (self.board[tile][0], (self.board[tile][1] + 1) % 4)

    def broadcastMove(self, client, move):
        for c in self.clients:
            if c != client:
                c.sendMessage("M{},{}".format(str(client.clientId), str(move)))

    def generateBoard(self):
        tileIds =       [0,   1,   2,   3]
        tileWeights =   [1.0, 1.0, 0.1, 0.3]
        width = 16
        height = 16

        availableTiles = []
        for i in range(len(tileWeights)):
            for q in range(int(tileWeights[i] * 259)):
                availableTiles.append(i)

        d = []
        for y in range(height):
            for x in range(width):
                d.append((tileIds[availableTiles[randint(0, len(availableTiles) - 1)]], randint(0, 3)))

        #dirty
        d[8 * 16 + 8] = (4, 0)
        return d

server = Server(u"ws://0.0.0.0:9000")
server.protocol = Client

log.startLogging(sys.stdout)
reactor.listenTCP(9000, server)
reactor.run()