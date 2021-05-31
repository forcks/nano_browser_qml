import QtQuick 2.12
import QtQuick.Window 2.12
import QtWebView 1.1
import QtQuick.Controls 2.12
import QtQuick.Controls.Styles 1.4
import QtQuick.Layouts 1.12
import QtQml 2.15

ApplicationWindow {
    id:root
    width: 640
    height: 480
    visible: true
    title: qsTr("Browser")

    //property var tabPage: TabButton {height: (root.height / 30);text: qsTr("new page")}

    TabBar{
        id:tabbar
        width: parent.width
        height: (root.height / 30)
        anchors.bottom: parent.bottom
        z:1

        Connections{
            target: appEngine
            function onSetPage(){
                var obj = Qt.createComponent("CustomTabButton.qml")
                var obj2 = obj.createObject(tabbar,{_text:"page "+(tabbar.count+1)});
                tabbar.addItem(obj2)
            }
        }
    }

    StackLayout {
        id:tabs
        width: parent.width
        height: (parent.height * 1.1)  - ((parent.height / 30) + (parent.height / 30))
        z:0
        currentIndex: tabbar.currentIndex
        Repeater{
            model: tabbar.count
            BrowserPage{
                Layout.fillHeight : true
                Layout.fillWidth : true
            }
        }
    }
}













