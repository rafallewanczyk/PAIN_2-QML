import QtQuick 2.0
import "./ballRectangleCollision.js" as Collision

Rectangle{
    id : b
    width : root.width/10 -1
    height: root.height/30
    radius: 3
    border.width: 2
    border.color : "#eff67b"
    color: "#a6b401"
    visible: true

    property bool active : true



    Timer{
        interval: 1
        repeat: true
        running:true

        onTriggered: {

            var collision =  Collision.collide(ball, b)
            if( collision !== 'none' && active){
                root.playerScore += 10
                console.log(x + " " + y)
                color = "transparent"
                border.color = "transparent"
                active = false
                if(collision === 'left') ball.x = ball.goLeft()
                if(collision === 'right') ball.x = ball.goRight()
                if(collision === 'bottom') ball.y = ball.goDown()
                if(collision === 'up') ball.y = ball.goUp()


            }
        }
    }


}
