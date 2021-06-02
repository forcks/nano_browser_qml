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
    Button{
        width: parent.width/10
        height: parent.height/1.5
        anchors.top: parent.top
        anchors.left: parent.left
        text: qsTr("*")
        font.pixelSize: (parent.height)/2
        onClicked: {
            appEngine.deletePage(index)
        }
    }
}
