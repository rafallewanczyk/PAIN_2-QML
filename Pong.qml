import QtQuick 2.0
import "./ballRectangleCollision.js" as Collision


Rectangle {
    id: root
    width : 600
    height : 600
    color : "#b3e7dc"
    property int playerScore: 0



    focus: true
    Keys.onEscapePressed: Qt.quit()
    Keys.onPressed:{

        ball.gameStarted=true
        ball.y = ball.height-root.height
        ball.x = ball.width - root.width
    }


    MouseArea {
        id: mouseArea
        anchors.fill : parent
        hoverEnabled : true
        onPositionChanged :paddle.x = mouseX-paddle.width/2
    }

    Item {
        id: collidable
        anchors.fill : parent

        Paddle{
            id: paddle
        }

        Ball{
            id: ball


            function goDown(){
                return root.height - ball.height
            }

            function goUp(){
                return ball.height - root.height
            }

            function goRight(){
                return root.width - ball.width
            }

            function goLeft(){
                return ball.width - root.width
            }

            onYChanged: {

                if(ball.gameStarted){

                    if(ball.y <= 0){
                        ball.y = goDown()
                    }

                    if(ball.y >= root.height - ball.height){
                        ball.gameStarted = false
                        gameOver.visible = true


                    }

                    if(ball.x <= 0){
                        ball.x = goRight()
                    }

                    if(ball.x >= root.width - ball.width){
                        ball.x = goLeft()
                    }

                    if(Collision.collide(ball, paddle) !== 'none'){
                        console.log("collision")
                        ball.y = goUp()
                        ball.xSpeed = Math.abs(paddle.x + paddle.width/2 - ball.x + ball.radius)*2

                        if(ball.x > paddle.x + paddle.width/2) {
                            ball.x = goRight()

                        }
                        else ball.x = goLeft()
                    }


                }

            }
        }

        Score{
            id: score
        }

        Grid{

            id:blocks
            rows : 10
            columns : 10
            spacing: 1

            Repeater{
                model: parent.rows * parent.columns
                Brick{
                    id: brick
                }
            }
        }


    }

    Text{
        id:gameOver
        text: "Game Over\nYour score is: " + playerScore + "\n ESC to leave"
        anchors.centerIn: root
        color:"red"
        font.pointSize:root.width/20
        visible:false
    }

}


