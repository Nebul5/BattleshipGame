#ifndef BACKEND_H
#define BACKEND_H

#include <QObject>
#include <QString>
#include <QList>
#include <QVector>

#include "Ship.h"

class BackEnd : public QObject
{
    Q_OBJECT

public:
    explicit BackEnd(QObject *parent = nullptr);

    Q_INVOKABLE void initializeShips(QList<QString> ships);
    Q_INVOKABLE int getShipLength(QString id);
    Q_INVOKABLE void switchPlayer();
    Q_INVOKABLE bool isSpinBoxIncreasing(QString id, int value);
    Q_INVOKABLE void setSpinBoxValue(QString id,int value);
    Q_INVOKABLE int getAmountOfShips(){
        if(isPlayer1)
            return shipsPlayer1.size();
        return shipsPlayer2.size();
    };
    Q_INVOKABLE QList<QString> getShipsIDs();

signals:

private:
    int previousCarrierSpinBoxValue = 0;
    int previousCruiserSpinBoxValue = 0;
    int previousDestroyerSpinBoxValue = 0;
    int previousSubSpinBoxValue = 0;
    int previousBattleshipSpinBoxValue = 0;

    bool isPlayer1 = true;
    QVector<Ship*> shipsPlayer1{};
    QVector<Ship*> shipsPlayer2{};
};
#endif
