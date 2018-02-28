#include "backend.h"

#include <QList>
#include <string>
using std::to_string;
#include <iostream>
#include "Ship.h"
#include "Game.h"
using std::cout;

BackEnd::BackEnd(QObject *parent) :
    QObject(parent)
{
}

void BackEnd::initializeShips(const QList<QString> &ships){

    for(int i = 0;i < ships.size();i++){
        if(ships[i]=="Carrier")
            shipIDs[isPlayer1].push_back(state.addShip(4,0,i));
        else if(ships[i] == "Cruiser")
            shipIDs[isPlayer1].push_back(state.addShip(1,0,i));
        else if(ships[i] == "Destroyer")
            shipIDs[isPlayer1].push_back(state.addShip(0,0,i));
        else if(ships[i] == "Sub")
            shipIDs[isPlayer1].push_back(state.addShip(3,0,i));
        else if(ships[i] == "Battleship")
            shipIDs[isPlayer1].push_back(state.addShip(2,0,i));
    }
}
int BackEnd::getShipLength(const int &id){
    return state.getShip(id).Length();
}
bool BackEnd::switchPlayer(){
    isPlayer1 = !isPlayer1;
    state.switchPlayer();
    return true;
}
bool BackEnd::isSpinBoxIncreasing(const QString &id, const int &value){
    if(id == "Cruiser"){
        if(previousCruiserSpinBoxValue < value)
            return true;
    }
    else if(id == "Battleship"){
        if(previousBattleshipSpinBoxValue < value)
            return true;
    }
    else if(id == "Sub"){
        if(previousSubSpinBoxValue < value)
            return true;
    }
    else if(id == "Destroyer"){
        if(previousDestroyerSpinBoxValue < value)
            return true;
    }
    else if(id == "Carrier"){
        if(previousCarrierSpinBoxValue < value)
            return true;
    }
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
bool BackEnd::moveShip(const int &id, const int &x, const int &y){
    state.moveShip(id,x,y);
    return true;
}
int BackEnd::getX(const int &id){
    return state.getShip(id).GetX();
}
int BackEnd::getY(const int &id){
    return state.getShip(id).GetY();
}
void BackEnd::displayConsole(){
    state.printBoard();
}
