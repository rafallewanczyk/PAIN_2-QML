import QtQuick 2.0

Rectangle {
    height: width
    width: Math.sqrt(parent.height * parent.height + parent.width * parent.width)/45
    radius: width/2
    x: root.width/2-radius
    y: root.height - 10*radius
    color: "#6c0102"

    property int xSpeed : 0
    property int ySpeed: 200


    property bool gameStarted: false


    Behavior on x{
        SpringAnimation{
            velocity: xSpeed
        }
    }

    Behavior on y{
        SpringAnimation{
            velocity: ySpeed
        }
    }

}
