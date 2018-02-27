
#include <QList>
#include <string>
using std::to_string;
#include <iostream>
#include "backend.h"
#include "Ship.h"
#include "Game.h"
using std::cout;

BackEnd::BackEnd(QObject *parent) :
    QObject(parent)
{
}

void BackEnd::initializeShips(const QList<QString> &ships){
    for(auto ship : ships){
        if(ship=="Carrier")
            shipIDs[isPlayer1].push_back(state.addShip(4,0,0));
        else if(ship == "Cruiser")
            shipIDs[isPlayer1].push_back(state.addShip(2,0,0));
        else if(ship == "Destroyer")
            shipIDs[isPlayer1].push_back(state.addShip(0,0,0));
        else if(ship == "Sub")
            shipIDs[isPlayer1].push_back(state.addShip(1,0,0));
        else if(ship == "Battleship")
            shipIDs[isPlayer1].push_back(state.addShip(3,0,0));
    }
}
int BackEnd::getShipLength(const int &id){
    return state.getShip(id).Length();
}
void BackEnd::switchPlayer(){
    isPlayer1 = !isPlayer1;
    state.switchPlayer();
}
bool BackEnd::isSpinBoxIncreasing(const QString &id, const int &value){
    if(id == "Cruiser")
        if(previousCruiserSpinBoxValue < value)
            return true;
    else if(id == "Battleship")
        if(previousBattleshipSpinBoxValue < value)
            return true;
    else if(id == "Sub")
        if(previousSubSpinBoxValue < value)
            return true;
    else if(id == "Destroyer")
        if(previousDestroyerSpinBoxValue < value)
            return true;
    else if(id == "Carrier")
        if(previousCarrierSpinBoxValue < value)
            return true;
    return false;
}
void BackEnd::setSpinBoxValue(const QString &id, const int &value){
    if(id == "Cruiser")
        previousCruiserSpinBoxValue = value;
    else if(id == "Battleship")
        previousBattleshipSpinBoxValue = value;
    else if(id == "Sub")
        previousSubSpinBoxValue = value;
    else if(id == "Destroyer")
        previousDestroyerSpinBoxValue = value;
    else if(id == "Carrier")
        previousCarrierSpinBoxValue = value;

}
QList<int> BackEnd::getShipsIDs(){
    QList<int> hold;
    for(auto shipID : shipIDs[isPlayer1])
        hold.push_back(shipID);
    return hold;
}
bool BackEnd::moveShip(const int &x, const int &y){
    return true;
}

