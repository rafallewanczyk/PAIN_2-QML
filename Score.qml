import QtQuick 2.0

Rectangle{
    id: s
    y : root.height - height
    width: root.width
    height: root.height/30
    color: "#0080FF"
    property int fontSize: root.height/45



    Text{
        id: scoreText
        text: 'score:'
        font.pointSize: fontSize
        color:"white"

    }
    Text{
        id :number
        property int  value: root.playerScore
        text: value
        font.pointSize:fontSize
        color:'white'
        x: scoreText.width

        Behavior on value{
            NumberAnimation{

                duration:1000


            }
        }
    }




}
