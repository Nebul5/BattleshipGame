#include "backend.h"
#include "Sub.h"
#include "Carrier.h"
#include "Destroyer.h"
#include "Battleship.h"
#include "Cruiser.h"
#include "Ship.h"
#include <QList>
#include <string>
using std::to_string;
#include <iostream>
using std::cout;
BackEnd::BackEnd(QObject *parent) :
    QObject(parent)
{
}

void BackEnd::initializeShips(QList<QString> ships){
    if(isPlayer1){
        for(auto ship : ships){
            if(ship=="Carrier")
                shipsPlayer1.push_back(new Carrier(to_string(shipsPlayer1.length())));
            else if(ship == "Cruiser")
                shipsPlayer1.push_back(new Cruiser(to_string(shipsPlayer1.length())));
            else if(ship == "Destroyer")
                shipsPlayer1.push_back(new Destroyer(to_string(shipsPlayer1.length())));
            else if(ship == "Sub")
                shipsPlayer1.push_back(new Sub(to_string(shipsPlayer1.length())));
            else if(ship == "Battleship")
                shipsPlayer1.push_back(new Battleship(to_string(shipsPlayer1.length())));
        }
    }
    else
    {
        for(auto ship : ships){
            if(ship=="Carrier")
                shipsPlayer2.push_back(new Carrier(to_string(shipsPlayer2.length())));
            else if(ship == "Cruiser")
                shipsPlayer2.push_back(new Cruiser(to_string(shipsPlayer2.length())));
            else if(ship == "Destroyer")
                shipsPlayer2.push_back(new Destroyer(to_string(shipsPlayer2.length())));
            else if(ship == "Sub")
                shipsPlayer2.push_back(new Sub(to_string(shipsPlayer2.length())));
            else if(ship == "Battleship")
                shipsPlayer2.push_back(new Battleship(to_string(shipsPlayer2.length())));
        }
    }
}
int BackEnd::getShipLength(QString id){
    if(isPlayer1){
        return shipsPlayer1[id.toInt()]->Length();
    }
    else{
        return shipsPlayer2[id.toInt()]->Length();
    }
    return 0;
}
void BackEnd::switchPlayer(){
    if(isPlayer1==true)
        isPlayer1 = false;
    else
        isPlayer1 = true;
}
bool BackEnd::isSpinBoxIncreasing(QString id, int value){
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
void BackEnd::setSpinBoxValue(QString id,int value){
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
QList<QString> BackEnd::getShipsIDs(){
    QList<QString> shipNames{};
    if(isPlayer1){
        for(size_t i =0;i < shipsPlayer1.size();i++){
            shipNames.push_back(QString::fromStdString(shipsPlayer1[i]->GetName()));
        }
    }
    else{
        for(size_t i =0;i < shipsPlayer2.size();i++){
            shipNames.push_back(QString::fromStdString(shipsPlayer2[i]->GetName()));
        }
    }
    return shipNames;
}
