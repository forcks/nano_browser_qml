import QtQuick 2.12
import QtQuick.Window 2.12
import QtWebView 1.1
import QtQuick.Controls 2.12
import QtQuick.Controls.Styles 1.4
import QtQuick.Layouts 1.12

ApplicationWindow {
    id:root
    width: 640
    height: 480
    visible: true
    title: qsTr("Browser")

    property var tabPage: TabButton {height: (root.height / 30);text: qsTr("new page")}

    BrowserPage{
        visible: false
    }
    Item{
        id:tabItem
        width: parent.width
        height: (root.height / 30)
        anchors.bottom: parent.bottom
        z:1
        TabBar {
            anchors.fill: parent
            id: bar

            //anchors.bottomMargin: (parent.height / 30)
            TabButton {
                id:tabButton
                height: parent.height
                text: qsTr("page 1")
            }
            Connections{
                target: appEngine
                function onSetPage(){
                    bar.addItem(tabItem.createObject(tabButton,{height: parent.height}));
                }
            }
        }
    }

    StackLayout {
        id:tabs
        width: parent.width
        height: (parent.height * 1.1)  - ((parent.height / 30) + (parent.height / 30))
        z:0
        anchors.top: parent
        anchors.left: parent
        currentIndex: bar.currentIndex
        Repeater{
            model: bar.count
            anchors.fill: parent
            BrowserPage{
                anchors.fill:parent
            }
        }

    }
}













