import QtQuick 2.12
import QtQuick.Window 2.12
import QtWebView 1.1
import QtQuick.Controls 2.12
import QtQuick.Controls.Styles 1.4
import QtQuick.Layouts 1.12
import QtQml 2.15

TabButton{
    id:root
    property var _text: "page"
    property var index: 0
    text: qsTr(_text)
    /*
    Text {
        text: qsTr(_text)
        color: "#FFADAD"
        font.pixelSize: parent.width/70 <= 10 ? 10 : parent.width/60
        anchors.centerIn: parent
    }*/

    Button{
        width: height
        height: parent.height/2.2
        anchors.verticalCenter: parent.verticalCenter
        anchors.left: parent.left
        //text: qsTr("*")
        font.pixelSize: (parent.height)/2
        background: Rectangle{
            radius: (parent.height)/5
            Image{
                width: parent.width/1.2
                height: parent.height/1.2
                anchors.centerIn: parent
                fillMode: Image.PreserveAspectFit
                source: "/img/cross.png"
            }
        }
        onClicked: {
            appEngine.deletePage(index)
        }
    }




}

