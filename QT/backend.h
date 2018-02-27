#ifndef BACKEND_H
#define BACKEND_H

#include <QObject>
#include <QString>
#include <QList>
#include <QVector>
#include "Game.h"
#include "Ship.h"

class BackEnd : public QObject
{
    Q_OBJECT

public:
    explicit BackEnd(QObject *parent = nullptr);

    Q_INVOKABLE void initializeShips(const QList<QString> &ships);
    Q_INVOKABLE int getShipLength(const int &id);
    Q_INVOKABLE void switchPlayer();
    Q_INVOKABLE bool isSpinBoxIncreasing(const QString &id, const int &value);
    Q_INVOKABLE void setSpinBoxValue(const QString &id, const int &value);
    Q_INVOKABLE int getAmountOfShips(){
        return getShipsIDs().length();
    }
    Q_INVOKABLE QList<int> getShipsIDs();
    Q_INVOKABLE bool moveShip(const int &x, const int &y);

signals:

private:
    int previousCarrierSpinBoxValue = 0;
    int previousCruiserSpinBoxValue = 0;
    int previousDestroyerSpinBoxValue = 0;
    int previousSubSpinBoxValue = 0;
    int previousBattleshipSpinBoxValue = 0;
    Game state;
    QVector<QVector<int>> shipIDs {{},{}};
    bool isPlayer1 = true;
};
#endif
